resource "local_file" "file" {
  content = var.content
  filename = var.filename
}