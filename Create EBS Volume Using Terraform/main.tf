resource "aws_ebs_volume" "nautilus_volume" {
    size = 2
    type = "gp3"
    availability_zone = "us-east-1a"


    tags = {
        name = "nautilus-volume"
    }
}