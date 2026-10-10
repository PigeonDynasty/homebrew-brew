cask "rscat" do
  version "1.1.7-3"
  sha256 "bc32aa9d3a8bf685cd6e8d6c151f2e40a1b40329f56c5bd48255daa673fc93f8"

  url "https://github.com/macOS-Terminal/rscat/releases/download/v#{version}/rscat-#{version}-macos-universal.pkg"
  name "rscat"
  desc "Rust cross-platform lolcat fork with image display support"
  homepage "https://github.com/macOS-Terminal/rscat"

  livecheck do
    url :url
  end

  auto_updates true
  depends_on :macos

  pkg "rscat-#{version}-macos-universal.pkg"

  postflight_steps do
    write_file "{{staged_path}}/uninstall-rscat.sh", <<~RSCAT_UNINSTALL
      #!/bin/bash
      # Removes what the rscat .pkg postinstall wired in: shell-integration
      # fenced blocks in rc files, the fish conf.d snippet, and the system-wide
      # /etc/zshenv block. Runs as the invoking (brew) user; system files go
      # through sudo. Every cleanup is non-fatal.
      set -u

      HOME_DIR="${HOME:-}"
      MARK="# >>> rscat shell integration >>>"
      SED_BLOCK1="/^# >>> rscat shell integration >>>/,/^# <<< rscat shell integration <<</d"
      SED_BLOCK2="/^# >>> rscat ENV (interactive sh) >>>/,/^# <<< rscat ENV (interactive sh) <<</d"

      for rc in .profile .bash_profile .bashrc .zshrc; do
        file="$HOME_DIR/$rc"
        [ -f "$file" ] || continue
        /usr/bin/grep -qF "$MARK" "$file" || continue
        /usr/bin/sed -i '' -e "$SED_BLOCK1" -e "$SED_BLOCK2" "$file"
        if ! /usr/bin/grep -q '[^[:space:]]' "$file"; then
          /bin/rm -f "$file"
        fi
      done

      /bin/rm -f "$HOME_DIR/.config/fish/conf.d/rscat.fish"

      if [ -f /etc/zshenv ] && /usr/bin/grep -qF "$MARK" /etc/zshenv; then
        sudo /usr/bin/sed -i '' -e "$SED_BLOCK1" -e "$SED_BLOCK2" /etc/zshenv || true
        if ! sudo /usr/bin/grep -q '[^[:space:]]' /etc/zshenv 2>/dev/null; then
          sudo /bin/rm -f /etc/zshenv 2>/dev/null || true
        fi
      fi

      for f in /etc/fish/conf.d/rscat.fish /usr/local/share/fish/vendor_conf.d/rscat.fish; do
        if [ -e "$f" ]; then
          sudo /bin/rm -f "$f" 2>/dev/null || true
        fi
      done

      exit 0
    RSCAT_UNINSTALL
  end

  uninstall script:  { executable: "uninstall-rscat.sh" },
            pkgutil: "mo.terminal.rscat",
            delete:  [
              "/usr/local/bin/rscat",
              "/usr/local/share/rscat",
            ]

  caveats <<~EOS
    The installer also wires shell integration into ~/.zshrc, ~/.bashrc,
    ~/.bash_profile, ~/.profile, /etc/zshenv and fish conf.d. Uninstall strips
    those blocks (with sudo for system-wide files), but only for the current
    user's home; other accounts and any .rscat-bak backups may need manual
    cleanup.
  EOS
end
