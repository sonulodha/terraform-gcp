resource "google_project_service" "project" {
        service         = "pubsub.googleapis.com"
        disable_dependent_services = false
        disable_on_destroy         = false
        }
resource "google_pubsub_topic" "pubsub_topic" {
        name                            = var.pubsub_topic_name

}

resource "google_pubsub_subscription" "pubsub_subscription" {
        depends_on                      = [google_pubsub_topic.pubsub_topic]
        name                            = var.pubsub_subscription_name
        topic                           = google_pubsub_topic.pubsub_topic.name
        message_retention_duration      = "604800s"     #Cannot be more than 7 days ("604800s") or less than 10 minutes ("600s").
        ack_deadline_seconds            = var.ack_deadline_seconds
        retain_acked_messages           = var.retain_acked_messages
        expiration_policy { 
                ttl = "7862400s"
        }
}
