
[gke1_systems]
# Must be in the form of <gke public IP> gke_url=<https URL of the endpoint>
${gcp_gke1_endpoint}  gke1_url=https://${gcp_gke1_endpoint}

[gke2_systems]
# Must be in the form of <gke public IP> gke_url=<https URL of the endpoint>
${gcp_gke2_endpoint}  gke2_url=https://${gcp_gke2_endpoint}

[gke3_systems]
# Must be in the form of <gke public IP> gke_url=<https URL of the endpoint>
${gcp_gke3_endpoint}  gke3_url=https://${gcp_gke3_endpoint}

[F51_systems]
# Must be in the form of <public IP> vs_ip=<private ip of the F5>
${gcp_F51_public_ip} vs_ip=${gcp_F51_private_ip}

[F52_systems]
# Must be in the form of <public IP> vs_ip=<private ip of the F5>
${gcp_F52_public_ip} vs_ip=${gcp_F52_private_ip}

[F53_systems]
# Must be in the form of <public IP> vs_ip=<private ip of the F5>
${gcp_F53_public_ip} vs_ip=${gcp_F53_private_ip}


[gke1_systems:vars]
gke_name=${gcp_gke1_cluster_name}

[gke2_systems:vars]
gke_name=${gcp_gke2_cluster_name}

[gke3_systems:vars]
gke_name=${gcp_gke3_cluster_name}

[F5_systems:vars]
ansible_user=admin
ansible_ssh_private_key_file=/drone/src/gcp/gcp_ssh_key

[all:vars]
# ep_list is used for defining the upstreams in the NGINX configuration. It can be given a default value and can be overriden later using set_fact in a role i.e. NGINX endpoints creation role
ep_list1=default('undefined')
ep_list2=default('undefined')
ep_list3=default('undefined')