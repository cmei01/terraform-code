resource "local_file" "sample" {
    filename = "test_file"
    content = "Hello world!"
    file_permission = "0700"
}
resource "random_pet" "pet" {
    prefix = "Mrs"
    separator = "."
    length = "1"
}
