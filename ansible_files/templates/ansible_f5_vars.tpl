---

ADMIN_PASSWORD: "{{ lookup('env', 'BIGIP_PASS') }}"
ADMIN_HTTPS_PORT: "8443"
ADMIN_USER: "admin"
APP_TAG_KEY: "Application"
APP_TAG_VALUE: "${gcp_tag_value}"