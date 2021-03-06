{ config, pkgs, lib, ... }: {
  home.file.adblock = {
    executable = true;
    target = ".local/bin/adblock";
    text = ''
      #!/bin/bash
      # Block ad serving and tracking system-wide even before a request is issued to them.

      SOURCE='https://someonewhocares.org/hosts/zero/hosts'
      BACKUP='https://raw.github.com/MattiSG/adblock/master/hosts.default'
      TARGET='/etc/hosts'
      DOWNLOADED='/etc/hosts.blocklist'
      ORIGINAL='/etc/hosts.without-adblock'


      # source: http://support.apple.com/kb/HT5343
      clear_dns_cache() {
        if command -v sw_vers >/dev/null 2>&1
        then
          if sw_vers -productVersion | grep -q '10\.6'
          then sudo dscacheutil -flushcache
          elif sw_vers -productVersion | grep -q '10\.10(\.[123])?$'
          then sudo killall -HUP discoveryd
          else sudo killall -HUP mDNSResponder
          fi

          echo 'DNS cache flushed'
        fi
      }

      initialize() {
        echo -n "Backing up your $TARGET file… "
        if [[ -a "$TARGET" ]]
        then sudo mv "$TARGET" "$ORIGINAL"
        else
          echo 'Oops, no hosts file found!'
          read -p "Do you want to install the default one from <$BACKUP>? [y/n]" -n 1 confirm
          if [[ $confirm == 'y' ]]
          then curl "$BACKUP" -k --show-error -\# --output "$ORIGINAL"
          else sudo touch "$ORIGINAL"
          fi
        fi
        echo "If you need to update your hosts file, edit $ORIGINAL"
      }

      block() {
        local tmpfile="$DOWNLOADED.part"

        sudo curl $SOURCE --show-error -k -\# --output "$tmpfile" && # -# is "show progress as a bar instead of full metrics"
        sudo rm -f "$DOWNLOADED" &&	# -f allows to be silent if the file does not exist
        sudo mv "$tmpfile" "$DOWNLOADED" &&
        sudo cat "$ORIGINAL" | sudo tee "$TARGET" > /dev/null &&
        sudo cat "$DOWNLOADED" | sudo tee -a "$TARGET" > /dev/null &&	# append to file rather than overwrite it
        echo 'Hosts file updated'
      }

      unblock() {
        if ! [[ -e "$ORIGINAL" ]]
        then
          echo "Already off"
          return
        fi

        sudo rm "$TARGET" &&
        sudo cp "$ORIGINAL" "$TARGET" &&
        echo 'Hosts file restored' &&
        sudo rm "$ORIGINAL"
      }

      should_update() {
        echo "Checking for updates…"

        local modification_time=$(curl --silent --show-error --head "$SOURCE" | grep 'Last-Modified' | cut -d ':' -f 2- | cut -d ' ' -f 2-)
        if date -v 1d > /dev/null 2>&1
        then  # this is the BSD `date`
          local modification_time_epoch=$(LANG=en_US date -j -f "%a, %d %b %Y %T %Z" "$modification_time" +%s 2> /dev/null)	# we need to specify the locale for this command to allow `date` to parse the date no matter the machine's locale  # silencing errors due to https://www.unix.com/os-x-apple-/168435-date-epoch-problem.html
        else  # this is the GNU `date`
          local modification_time_epoch=$(LANG=en_US date -d"$modification_time" +%s)  # we need to specify the locale for this command to allow `date` to parse the date no matter the machine's locale
        fi

        local update_time=$(date -r "$DOWNLOADED" +%s)

        if [[ $modification_time_epoch -gt $update_time ]]
        then
          echo "Recent update from $modification_time"
          return 0
        else
          echo "No new updates since $modification_time"
          return 1
        fi
      }

      stats() {
        local count=$(grep '^0.0.0.0' "$TARGET" | wc -l | tr -d ' ')

        echo "$count domains currently blocked"
      }


      if [[ $1 == 'off' ]] || [[ $1 == '--off' ]]
      then
        unblock &&
        clear_dns_cache
      elif ! [[ -a "$ORIGINAL" ]]
      then
        initialize &&
        echo "Installing blocklist…" &&
        block &&
        clear_dns_cache
      elif [[ $1 == '--force' ]] || should_update
      then
        block &&
        clear_dns_cache
      fi

      stats
    '';
  };
}
