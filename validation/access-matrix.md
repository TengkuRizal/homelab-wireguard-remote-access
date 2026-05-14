# Access Matrix

## VPN Access Matrix

| Source | Destination | Access | Purpose |
|---|---|---|---|
| VPN Client | Proxmox | Allowed | Remote management |
| VPN Client | GitLab | Allowed | CI/CD management |
| VPN Client | Kubernetes API | Allowed | Cluster administration |
| VPN Client | Wazuh Dashboard | Allowed | SIEM monitoring |
| VPN Client | Grafana | Allowed | Monitoring dashboard |
| VPN Client | Security Onion | Allowed | Network monitoring |
| VPN Client | Windows AD | Restricted | Admin/testing only |
| VPN Client | Kali Linux | Restricted | Security testing only |

## Notes

VPN access follows least privilege principles. Administrative interfaces should only be reachable through VPN and protected by firewall rules.
