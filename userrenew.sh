            user-list.sh
	    #!/bin/bash
 


            read -p "Masukkan Username Yang Akan Diperpanjang: " username
            egrep "^$username" /etc/passwd >/dev/null
            if [ $? -eq 0 ]; then
            read -p "Masukkan Tambahan Masa Aktif Account terhitung dari hari ini(Hari): " masa_aktif

            today=`date +%s`
            masa_aktif_detik=$(( $masa_aktif * 86400 ))
            saat_expired=$(($today + $masa_aktif_detik))
            tanggal_expired=$(date -u --date="1970-01-01 $saat_expired sec GMT" +%Y/%m/%d)
            tanggal_expired_display=$(date -u --date="1970-01-01 $saat_expired sec GMT" '+%d %B %Y')

           
            passwd -u $username
            usermod -e  $tanggal_expired $username
            egrep "^$username" /etc/passwd >/dev/null
            echo -e "$password\n$password" | passwd $username
            echo""
            echo "Script by overses.net"
            echo "Terimakasih sudah berlangganan di @orangkuatsabahanterkini"
            echo " "
            echo "Demikian Detail Account Yang Telah Diperpanjang"
            echo "---------------------------------------"
            echo "Username        : $username"
            echo "Masa aktif      : $masa_aktif Hari"
            echo "Tanggal Expired : $tanggal_expired_display"
            echo "--------------------------------------"

            else
            echo -e "Username ${red}$username${NC} tidak ditemukan di VPS anda"
            exit 0
            fi
