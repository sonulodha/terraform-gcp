/******************************************
	CLOUD PUBSUB VARIABLES
 *****************************************/
variable "pubsub_topic_name" {
  type  = string
  description = "name of the topic"
  default = "topic"
}

variable "pubsub_subscription_name" {
  type = string
  description = "name of the subscription"
  default = "sub"
}

variable "ack_deadline_seconds" {
  type = number
  description = "for pull subscriptions, this value is used as the initial value for the ack deadline"
  default = 300
}
variable "retain_acked_messages" {
  type = bool
  description = "indicates whether to retain acknowledged messages"
  default = false
}
