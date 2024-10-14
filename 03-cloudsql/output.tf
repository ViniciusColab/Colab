# resource "local_file" "export_databases" {
#   content = jsonencode({
#     service_mysql_instance = {
#         self_link = google_sql_database_instance.service_mysql_instance.self_link,
#         id        = google_sql_database_instance.service_mysql_instance.id,
#         name      = google_sql_database_instance.service_mysql_instance.name,
#         database_version = google_sql_database_instance.service_mysql_instance.database_version,
#         ip_address = google_sql_database_instance.service_mysql_instance.ip_address,
#     }
#     service_postgres_instance = {
#         self_link = google_sql_database_instance.service_postgres_instance.self_link,
#         id        = google_sql_database_instance.service_postgres_instance.id,
#         name      = google_sql_database_instance.service_postgres_instance.name,
#         database_version = google_sql_database_instance.service_postgres_instance.database_version,
#         ip_address = google_sql_database_instance.service_postgres_instance.ip_address,
#     }
#   })
#   filename = "./databases.json"
# }