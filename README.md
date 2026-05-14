# Homelab WireGuard Remote Access

## Overview

This project documents the implementation of secure remote access into my segmented DevOps and DevSecOps homelab using WireGuard VPN on Mikrotik.

The goal of this project is to allow controlled remote access into internal homelab networks without exposing internal services directly to the internet.

## Project Objectives

- Implement secure VPN access using WireGuard
- Access internal homelab networks remotely
- Route VPN clients to segmented lab networks
- Protect internal systems behind pfSense firewall
- Support remote administration of Proxmox, Kubernetes, GitLab, Wazuh, Security Onion, and lab VMs
- Document routing, firewall rules, access validation, and troubleshooting steps

## High-Level Architecture

Remote Client
    |
    | WireGuard VPN
    |
Mikrotik Router
    |
    | Transit Network
    |
pfSense Firewall
    |
    +-----------------------------+
    | SOC Zone: 10.10.1.0/24      |
    | Target Zone: 10.10.2.0/24   |
    | Attacker Zone: 10.10.3.0/24 |
    +-----------------------------+

## Network Design

| Network | Subnet | Purpose |
|---|---:|---|
| WireGuard VPN | 10.10.10.0/24 | Remote VPN clients |
| SOC Zone | 10.10.1.0/24 | GitLab, Wazuh, Kubernetes Master, Monitoring |
| Target Zone | 10.10.2.0/24 | DVWA, Windows AD, Windows Client, Kubernetes Worker |
| Attacker Zone | 10.10.3.0/24 | Kali Linux, Kubernetes Worker |
| Transit/LAN | 192.168.0.0/24 | Mikrotik to pfSense routing |

## Core Components

| Component | Role |
|---|---|
| Mikrotik Router | WireGuard VPN endpoint and routing |
| pfSense Firewall | Firewall and gateway for lab networks |
| WireGuard Client | Remote secure access device |
| Proxmox | Virtualization platform |
| Kubernetes | Container orchestration lab |
| GitLab CE | Source code and CI/CD platform |
| Wazuh | SIEM and endpoint security monitoring |
| Security Onion | Network security monitoring |

## Routing Design

The Mikrotik router routes traffic from the WireGuard VPN subnet to the internal homelab networks through pfSense.

| Destination Network | Gateway |
|---|---|
| 10.10.1.0/24 | 192.168.0.100 |
| 10.10.2.0/24 | 192.168.0.100 |
| 10.10.3.0/24 | 192.168.0.100 |

## Access Use Cases

After connecting to WireGuard VPN, the remote client can securely access:

- Proxmox management interface
- GitLab web interface
- Kubernetes API/internal services
- Wazuh dashboard
- Security Onion dashboard
- Windows AD lab
- Linux servers
- Monitoring dashboards
- Internal application services

## Security Considerations

- Internal services are not exposed directly to the public internet
- VPN access is controlled through WireGuard keys
- Firewall rules restrict access between zones
- pfSense protects segmented internal networks
- Remote access is limited to authorized VPN peers
- Sensitive keys and public IPs are not committed to this repository

## Validation

Connectivity was validated using:

- ping
- traceroute
- ssh
- curl
- kubectl

Example validation targets:

- 10.10.1.0/24 - SOC Zone
- 10.10.2.0/24 - Target Zone
- 10.10.3.0/24 - Attacker Zone

## Documentation

| Document | Description |
|---|---|
| architecture/network-diagram.md | Network design and traffic flow |
| architecture/routing-table.md | Static routing design |
| configs/mikrotik-wireguard-sanitized.rsc | Sanitized Mikrotik WireGuard configuration |
| configs/client-config-sanitized.conf | Sanitized WireGuard client configuration |
| configs/pfsense-firewall-rules.md | pfSense firewall rule documentation |
| validation/connectivity-tests.md | VPN connectivity test results |
| validation/access-matrix.md | Allowed access matrix |
| security/vpn-hardening.md | VPN security hardening notes |
| troubleshooting/common-issues.md | Common issues and fixes |
| docs/interview-explanation.md | Interview explanation for this project |

## Skills Demonstrated

- WireGuard VPN
- Mikrotik routing
- pfSense firewalling
- Static routing
- Network segmentation
- Remote access security
- Homelab infrastructure design
- Troubleshooting and validation
- Documentation for production-like operations

## Interview Summary

This project demonstrates how I implemented secure remote access into a segmented homelab environment using WireGuard VPN on Mikrotik.

The setup allows authorized remote clients to access internal DevOps and security systems such as Proxmox, GitLab, Kubernetes, Wazuh, and Security Onion without exposing them directly to the internet.

The design uses Mikrotik as the VPN endpoint, pfSense as the internal firewall gateway, and multiple segmented networks to separate SOC, target, and attacker environments.
