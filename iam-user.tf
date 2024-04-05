resource "local_file" "sample" {
    filename = "test_file"
    content = "Hello world!"
}
resource "random_pet" "name" {
    prefix = "Mrs"
    separator = "."
    length = "1"
}