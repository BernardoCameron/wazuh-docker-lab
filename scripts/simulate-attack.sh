echo "[*] Simulando fuerza bruta SSH..."
for i in $(seq 1 20); do
  echo "$(date '+%b %d %H:%M:%S') wazuh-agent sshd[1234]: Failed password for invalid user admin from 192.168.1.100 port 4444 ssh2" >> /var/log/auth.log
  sleep 0.2
done
echo "[+] Fuerza bruta SSH completada."