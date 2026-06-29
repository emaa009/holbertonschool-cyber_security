# Passive Reconnaissance Report: holbertonschool.com

**Date:** 2024  
**Target:** holbertonschool.com  
**Method:** Passive reconnaissance using Shodan, whois, nslookup, dig, subfinder  
**Scope:** Public-facing infrastructure only — no active scanning performed

---

## 1. WHOIS / Registrant Information

| Field              | Value                                                              |
|--------------------|--------------------------------------------------------------------|
| Registrant Name    | Holberton Inc                                                      |
| Organization       | Holberton Inc                                                      |
| Street             | 5670 Wilshire Blvd Suite 1802                                      |
| City               | Los Angeles                                                        |
| State/Province     | California                                                         |
| Postal Code        | 90036                                                              |
| Country            | US                                                                 |
| Registrant Phone   | +1.4156227634                                                      |
| Registrant Email   | 7da97d10931ddb501d08b8f88c7384bc-37846707@contact.gandi.net        |
| Admin Phone        | +1.4153580819                                                      |
| Admin Email        | 624a82de74a4fa2b64fb39bbe08b290d-37876671@contact.gandi.net        |
| Tech Email         | 2c420b43d982c37b7621f2015f3e107b-37876677@contact.gandi.net        |
| Registrar          | Gandi SAS                                                          |

> **Note:** Contact emails are privacy-protected via Gandi's WHOIS masking service.

---

## 2. DNS Records

### A Records (IPv4)

| Hostname              | IP Address      |
|-----------------------|-----------------|
| holbertonschool.com   | 75.2.70.75      |
| holbertonschool.com   | 99.83.190.102   |

> Both IPs resolve to **AWS Global Accelerator** anycast endpoints, indicating the main domain is fronted by AWS's global load-balancing network.

### Name Servers (NS Records)

| Nameserver                        |
|-----------------------------------|
| ns-1455.awsdns-53.org             |
| ns-1619.awsdns-10.co.uk           |
| ns-176.awsdns-22.com              |
| ns-792.awsdns-35.net              |

> DNS is fully managed through **Amazon Route 53**.

### Mail Servers (MX Records)

| Priority | Mail Server                  |
|----------|------------------------------|
| 1        | aspmx.l.google.com           |
| 5        | alt1.aspmx.l.google.com      |
| 5        | alt2.aspmx.l.google.com      |
| 10       | alt3.aspmx.l.google.com      |
| 10       | alt4.aspmx.l.google.com      |

> Email is handled entirely by **Google Workspace (Gmail)**.

### TXT Records (SPF / Domain Verification)

| Purpose                  | Value                                                                                                      |
|--------------------------|------------------------------------------------------------------------------------------------------------|
| SPF Policy               | `v=spf1 include:mailgun.org include:_spf.google.com include:spf.exclaimer.net include:mail.zendesk.com include:servers.mcsv.net include:_spf.intacct.com ip4:104.209.35.28 ip4:191.237.4.149 ~all` |
| Apple Domain Verification| apple-domain-verification=sqTGlUgV9vVTnBuB                                                                |
| Google Site Verification | google-site-verification=lnffgexG_GGal6Fa53z0Ve4dJY4z4GXAmy1I2_ldotk                                     |
| Dropbox Verification     | dropbox-domain-verification=pvxn88z3e06i                                                                   |
| MS Verification          | MS=BB8A869E4E8A47D208F560DE7D83F199D1BB8F4F                                                               |
| LoaderIO                 | loaderio=67a0fbf5fb42755902d5415639d826a6                                                                  |
| Intacct ESK              | intacct-esk=A3E9DCEA8FB6B747E0539A220D0A9719                                                               |

> The SPF record reveals third-party email services: **Mailgun**, **Google**, **Exclaimer**, **Zendesk**, **Mailchimp (mcsv.net)**, and **Intacct**. Two static outbound IPs are also authorized: `104.209.35.28` and `191.237.4.149`.

---

## 3. IP Ranges Identified (Shodan / DNS)

| IP Address        | ASN / Owner                        | Usage                          |
|-------------------|------------------------------------|--------------------------------|
| 75.2.70.75        | AS16509 – Amazon (Global Accelerator) | Main domain load balancer   |
| 99.83.190.102     | AS16509 – Amazon (Global Accelerator) | Main domain load balancer   |
| 13.36.10.99       | AS16509 – Amazon AWS (eu-west-3)   | apply.holbertonschool.com      |
| 13.37.98.87       | AS16509 – Amazon AWS (eu-west-3)   | read.holbertonschool.com       |
| 13.38.122.220     | AS16509 – Amazon AWS (eu-west-3)   | staging-apply-forum            |
| 13.38.216.13      | AS16509 – Amazon AWS (eu-west-3)   | lvl2-discourse-staging         |
| 18.66.196.8       | AS16509 – Amazon AWS (CloudFront)  | staging-rails-assets-apply     |
| 34.203.198.145    | AS14618 – Amazon AWS (us-east-1)   | v2.holbertonschool.com         |
| 44.214.9.111      | AS14618 – Amazon AWS (us-east-1)   | beta.holbertonschool.com       |
| 52.47.143.83      | AS16509 – Amazon AWS (eu-west-3)   | yriry2.holbertonschool.com     |
| 52.85.96.82       | AS16509 – Amazon AWS (CloudFront)  | rails-assets.holbertonschool.com |
| 52.85.96.95       | AS16509 – Amazon AWS (CloudFront)  | assets.holbertonschool.com     |
| 54.86.136.129     | AS14618 – Amazon AWS (us-east-1)   | v1.holbertonschool.com         |
| 54.89.246.137     | AS14618 – Amazon AWS (us-east-1)   | v3.holbertonschool.com         |
| 54.157.56.129     | AS14618 – Amazon AWS (us-east-1)   | alpha.holbertonschool.com      |
| 63.35.51.142      | AS16509 – Amazon AWS (eu-west-1)   | www, fr, webflow, smile2021    |
| 104.16.53.111     | AS13335 – Cloudflare               | support.holbertonschool.com    |
| 151.139.128.10    | AS54113 – Fastly                   | fr.webflow, en.fr subdomains   |
| 192.0.78.131      | AS2635 – Automattic (WordPress)    | blog.holbertonschool.com       |
| 35.180.20.42      | AS16509 – Amazon AWS (eu-west-3)   | staging-apply.holbertonschool.com |

### IP Range Summary

| CIDR Range            | Provider          | Region         |
|-----------------------|-------------------|----------------|
| 13.36.0.0/14          | Amazon AWS        | eu-west-3 (Paris) |
| 18.64.0.0/10          | Amazon CloudFront | Global CDN     |
| 34.192.0.0/10         | Amazon AWS        | us-east-1      |
| 44.192.0.0/10         | Amazon AWS        | us-east-1      |
| 52.84.0.0/14          | Amazon CloudFront | Global CDN     |
| 54.80.0.0/12          | Amazon AWS        | us-east-1      |
| 63.32.0.0/11          | Amazon AWS        | eu-west-1 (Ireland) |
| 75.2.0.0/16           | Amazon Global Accelerator | Global |
| 99.83.0.0/16          | Amazon Global Accelerator | Global |
| 104.16.0.0/12         | Cloudflare        | Global CDN     |
| 151.139.128.0/17      | Fastly            | Global CDN     |
| 192.0.72.0/21         | Automattic        | WordPress.com  |

---

## 4. Subdomains Discovered

| Subdomain                                    | IP Address        | Notes                          |
|----------------------------------------------|-------------------|--------------------------------|
| www.holbertonschool.com                      | 63.35.51.142      | Main website (Webflow)         |
| apply.holbertonschool.com                    | 13.36.10.99       | Student application portal     |
| staging-apply.holbertonschool.com            | 35.180.20.42      | Staging environment            |
| staging-apply-forum.holbertonschool.com      | 13.38.122.220     | Staging forum                  |
| staging-rails-assets-apply.holbertonschool.com | 18.66.196.8     | Staging assets (CloudFront)    |
| apply-staging.holbertonschool.com            | –                 | Alternate staging entry        |
| rails-assets.holbertonschool.com             | 52.85.96.82       | Static asset delivery (CloudFront) |
| assets.holbertonschool.com                   | 52.85.96.95       | Static assets (CloudFront)     |
| blog.holbertonschool.com                     | 192.0.78.131      | WordPress.com hosted blog      |
| blog-new.holbertonschool.com                 | –                 | New blog (in migration)        |
| support.holbertonschool.com                  | 104.16.53.111     | Cloudflare / Zendesk support   |
| help.holbertonschool.com                     | 75.2.70.75        | Help center                    |
| fr.holbertonschool.com                       | 63.35.51.142      | French localized site          |
| en.fr.holbertonschool.com                    | 151.139.128.10    | English-French site (Fastly)   |
| fr.webflow.holbertonschool.com               | 151.139.128.10    | Webflow French staging         |
| webflow.holbertonschool.com                  | 63.35.51.142      | Webflow staging/preview        |
| read.holbertonschool.com                     | 13.37.98.87       | Reading / learning platform    |
| v1.holbertonschool.com                       | 54.86.136.129     | Version 1 of the platform      |
| v2.holbertonschool.com                       | 34.203.198.145    | Version 2 of the platform      |
| v3.holbertonschool.com                       | 54.89.246.137     | Version 3 of the platform      |
| alpha.holbertonschool.com                    | 54.157.56.129     | Alpha testing environment      |
| beta.holbertonschool.com                     | 44.214.9.111      | Beta testing environment       |
| lvl2-discourse-staging.holbertonschool.com   | 13.38.216.13      | Discourse forum (staging)      |
| 22support.holbertonschool.com                | –                 | Legacy support subdomain       |
| hippokampoi.holbertonschool.com              | –                 | Internal tool / codename       |
| yriry2.holbertonschool.com                   | 52.47.143.83      | Unknown / internal             |
| smile2021.holbertonschool.com                | 63.35.51.142      | Campaign/event page (2021)     |

---

## 5. Technologies & Frameworks

### Frontend & CMS

| Technology     | Evidence                                                    | Subdomains Affected                  |
|----------------|-------------------------------------------------------------|--------------------------------------|
| **Webflow**    | Webflow CDN headers, `webflow.holbertonschool.com` subdomain | www, fr, webflow, smile2021          |
| **WordPress**  | Hosted on Automattic IP range (192.0.78.0/21)               | blog.holbertonschool.com             |
| **Ruby on Rails** | `rails-assets` subdomain, Shodan HTTP headers            | apply, staging environments          |

### Backend & Infrastructure

| Technology               | Evidence                                                      |
|--------------------------|---------------------------------------------------------------|
| **AWS EC2**              | Multiple IPs resolving to AWS ASN (14618, 16509)              |
| **AWS CloudFront**       | `rails-assets` and `assets` subdomains on 52.85.x.x range    |
| **AWS Global Accelerator** | Main domain IPs (75.2.70.75, 99.83.190.102)               |
| **Amazon Route 53**      | All 4 NS records are `awsdns-*` nameservers                   |

### Community / Support

| Technology       | Evidence                                                        |
|------------------|-----------------------------------------------------------------|
| **Discourse**    | `lvl2-discourse-staging.holbertonschool.com` subdomain          |
| **Zendesk**      | SPF record includes `mail.zendesk.com`; support subdomain       |

### CDN / Edge

| Provider      | Evidence                                                       | Subdomains                       |
|---------------|----------------------------------------------------------------|----------------------------------|
| **Fastly**    | IPs 151.139.128.10 in Fastly ASN (54113)                       | fr.webflow, en.fr                |
| **Cloudflare**| support.holbertonschool.com on Cloudflare IP (104.16.53.111)   | support                          |

### Email & Communication Services (from SPF TXT)

| Service         | Domain in SPF                |
|-----------------|------------------------------|
| Google Workspace| `_spf.google.com`            |
| Mailgun         | `mailgun.org`                |
| Mailchimp       | `servers.mcsv.net`           |
| Zendesk         | `mail.zendesk.com`           |
| Exclaimer       | `spf.exclaimer.net`          |
| Sage Intacct    | `_spf.intacct.com`           |

### Domain Verification Services Found

| Service            | Verified Via TXT Record |
|--------------------|-------------------------|
| Google             | ✓                       |
| Apple              | ✓                       |
| Dropbox            | ✓                       |
| Microsoft          | ✓                       |
| LoaderIO           | ✓ (load testing tool)   |
| Sage Intacct (ERP) | ✓                       |

---

## 6. Key Findings & Observations

1. **AWS-heavy infrastructure:** Nearly all compute and CDN delivery runs on AWS, primarily in `eu-west-1` (Ireland) and `eu-west-3` (Paris) regions, consistent with a company serving European students, alongside `us-east-1` for older versioned environments.

2. **Multiple exposed environments:** Active staging and versioned subdomains (`v1`, `v2`, `v3`, `alpha`, `beta`, `staging-apply`, `staging-apply-forum`) are publicly resolvable and accessible, which may expose pre-release features or older vulnerable code.

3. **Webflow for frontend:** The main marketing site and localized pages are built and hosted on Webflow, delivered through a mix of Fastly and AWS infrastructure.

4. **Discourse forum in use:** A Discourse-based community forum was identified at the staging level, suggesting a production forum may also exist or be planned.

5. **ERP integration (Intacct):** The presence of `_spf.intacct.com` in the SPF record and `intacct-esk` TXT record indicates use of Sage Intacct for financial/accounting operations.

6. **Load testing tool:** The `loaderio` TXT record reveals the use of Loader.io, a SaaS load testing service, which discloses internal DevOps tooling.

7. **Privacy-masked WHOIS:** All registrant contact emails route through Gandi's WHOIS privacy proxy, limiting direct contact information exposure.

---

## 7. Shodan Query Reference

The following Shodan queries were used during this reconnaissance:

```
hostname:holbertonschool.com
org:"Holberton"
ssl:"holbertonschool.com"
http.title:"Holberton"
```

---

*This report was produced for educational purposes as part of a passive reconnaissance exercise. No active scanning or exploitation was performed.*
