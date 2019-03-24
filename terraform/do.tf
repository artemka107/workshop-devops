provider "digitalocean" {
  token = "${var.workshop_do_token}"
}

resource "digitalocean_ssh_key" "artem_i" {
  name       = "artem_i"
  public_key = "${file("./files/artem_i.pub")}"
}

resource "digitalocean_droplet" "workshop" {
  image  = "docker-18-04"
  name   = "web-1"
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.artem_i.fingerprint}"]
}
