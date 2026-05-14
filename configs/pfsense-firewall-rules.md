# pfSense Firewall Rules

## Objective

pfSense controls access between the transit network, VPN subnet, and segmented homelab networks.

The goal is to allow authorized WireGuard VPN clients to access required internal systems while keeping lab networks segmented and protected.

## Recommended Rule Design

| Source | Destination | Port | Action | Purpose |
|---|---|---:|---|---|
| 10.10.10.0/24 | 10.10.1.0/24 | Restricted | Allow | VPN to SOC Zone |
| 10.10.10.0/24 | 10.10.2.0/24 | Restricted | Allow | VPN to Target Zone |
| 10.10.10.0/24 | 10.10.3.0/24 | Restricted | Allow | VPN to Attacker Zone |

## Common Management Ports

| Service | Port | Purpose |
|---|---:|---|
| SSH | 22 | Linux administration |
| HTTP | 80 | Web services |
| HTTPS | 443 | Secure web services |
| Proxmox | 8006 | Proxmox management UI |
| Kubernetes API | 6443 | Kubernetes cluster administration |
| Grafana | 3000 | Monitoring dashboard |
| GitLab | 80/443 | GitLab web interface |
| Wazuh Dashboard | 443 | SIEM dashboard |

## Production-Like Hardening

For better security, avoid allowing all ports from the VPN subnet.

Recommended approach:

1. Allow only required management ports
2. Log important allow and deny rules
3. Apply deny-by-default between sensitive zones
4. Restrict access to administrative interfaces
5. Review firewall rules regularly
6. Avoid exposing internal dashboards directly to the public internet

## Example Access Policy

| Source | Destination | Allowed Services |
|---|---|---|
| VPN Client | SOC Zone | SSH, HTTPS, Proxmox, GitLab, Grafana, Wazuh |
| VPN Client | Target Zone | SSH, RDP, HTTP/HTTPS for lab testing |
| VPN Client | Attacker Zone | SSH only when required |

## Notes

This file documents the intended firewall policy only. Do not export and publish full pfSense configuration files because they may contain sensitive data.
