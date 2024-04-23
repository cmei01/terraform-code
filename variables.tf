variable "filename" {
    description = "The file name of the random PET output"
    default = "./pets.txt"
}
variable "content" {
    default = "We love pets"
}
variable "prefix" {
    default = "Mrs"
}
variable "separator" {
    default = "."
}
variable "length" {
    default = "2"
}

variable "webserverHttpPort" {
    description = "The webserver HTTP port number"
    default = 8080
}