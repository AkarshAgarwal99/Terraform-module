provider "aws" {
  region = "ap-south-1"
  profile = "Akarsh"
}

module "vpc" {
    source = "./vpc"
    
}

module "subnet" {
    source = "./subnet"
    vpc1 = "${module.vpc.vpc1}"
    vpc2 = "${module.vpc.vpc2}"
    
}

module "internetgw" {
    source = "./internetgw"
    vpcmain = "${module.vpc.vpc1}"
    vpcmainid = "${module.vpc.vpc2}"
    
}

module "lb" {
    source = "./lb"
    vpclb = "${module.vpc.vpc1}"
    vpclbid = "${module.vpc.vpc2}"
    tg = "${module.targetgroup.awstg}"
    lbsg = "${module.securitygroup.sg2}"
    lbsub1 = "${module.subnet.subnet1}"
    lbsub2 = "${module.subnet.subnet2}"
    lbtgarn = "${module.lb.awslbarn}"
    lbrealarn = "${module.lb.awsreallb}"
}

module "targetgroup" {
    source = "./tg"
    #vpcmain = "${module.vpc.vpc1}"
    vpcidtg = "${module.vpc.vpc2}"
    instance1id = "${module.ec2.awsins1id}"
    instance2id = "${module.ec2.awsins2id}"
    mytgarn = "${module.targetgroup.awstgarn}"

    
}

module "routetable" {
    source = "./routetable"
    routegw = "${module.internetgw.MY_Internet_Gateway}"
    routegwid = "${module.internetgw.MY_Internet_Gateway_ID}"
    routevpcid = "${module.vpc.vpc2}"
    routesubid1 = "${module.subnet.subnet1}"
    routesubid2 = "${module.subnet.subnet2}"
    routetbid = "${module.routetable.Routetable}"
 
}

module "securitygroup" {
    source = "./securitygroup"
    sgvpc = "${module.vpc.vpc1}"
    sgvpcid = "${module.vpc.vpc2}"
    
}

module "key" {
    source = "./key"
    
}

module "ec2" {
    source = "./ec2"
    routetable = "${module.routetable.Route}"
    subnet_id = "${module.subnet.subnet1}"
    security_g = "${module.securitygroup.sg1}"
    security_g_two = "${module.securitygroup.sg2}"
    subnet2id = "${module.subnet.subnet2}"
    Mykey = "${module.key.Key}"
}