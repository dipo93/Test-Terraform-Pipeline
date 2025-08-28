
# EXERCISE 1
# Create a terraform module that will only accept a palindrome as an input variable and display the output variable using the output block
/*
variable "palindrome" {
    type = string
    validation {
        condition = strrev(var.palindrome) == var.palindrome
        error_message = "Not a palindome."
    }
}

output "outstring" {
    value = var.palindrome
}
*/


# EXERCISE 2
# Create a terraform module that will accept a list of numbers and the output should sum the first 2
/*
variable "sumList" {
    type = list(number)
}

output "outlist" {
    value = var.sumList[0] + var.sumList[1]
}
*/


# EXERCISE 3
# Create a terrform module that will accept a list of numbers and the output should be a signum on that list of number
/*
variable "signumList" {
    type = list(number)
}

locals {
    out = [
        for s in var.signumList : signum(s)
    ]
}

output "outlist" {
    value = local.out
}
*/


# EXERCISE 4
# Create a terraform module that expects a object that contains {name and age } and create a validation that will reject age < 18
/*
variable "person" {
    type = object({
        name = string
        age  = number
    })
    validation {
        condition = var.person.age >= 18
        error_message = "Age is less than 18"
    }
}

output "checkAge" {
    value = var.person
}
*/


# EXERCISE 5
# Create a terraform module that expects a list that contains name. Make the name as UPPERCASE and show as output
/*
variable "people" {
    type = list(object({
      name = string
    }))
}

locals {
    out = [
        for person in var.people : upper(person.name)
    ]
}

output "nameUpperCase" {
    value = local.out
}
*/


# EXERCISE 6
/* Define the variable block for the below mentioned unstructured input
simpleMapExample={
    subnet1 = {cidr_block="10.0.0.0/20",region="us-central1"}
    subnet2 = {cidr_block="10.2.0.0/20",region="us-central1"}
    subnet3 = {test="rohit"} 
} */
/*
variable "simpleMapExample" {
    type = map(any)
}

output "outSimpleMap" {
    value = var.simpleMapExample
}
*/


/* Define the variable block for the below mentioned structured input using maps
mapExample={
    subnet1 =  {cidr_block="10.0.0.0/20",region="us-central1"}
    subnet2 =  {cidr_block="10.2.0.0/20",region="us-central1"}   
} */
/*
variable "mapExample" {
    type = map(object({
        cidr_block = string
        region = string
    }))
}

output "outMapExample" {
    value = var.mapExample
}
*/


/* Define the variable block for the below mentioned structured input  using maps
simpleMapListObjectExample = {
    subnet1 =  [{cidr_block="10.0.0.0/20",region="us-central1"},{cidr_block="10.2.0.0/20",region="us-central1"}]
    subnet2 =  [{cidr_block="10.0.0.0/20",region="us-central1"},{cidr_block="10.2.0.0/20",region="us-central1"}]
} */
/*
variable "simpleMapListObjectExample" {
    type = map(
        list(
            object({
                cidr_block = string
                region = string
            })
        )
    )
}

output "simpleMapListObjectExample" {
    value = var.simpleMapListObjectExample
}
*/


# EXERCISE 7
/* Define variable block for the below mentioned structured Object input using set
[{cidr_block="10.0.0.0/20",region="us-central1"},{cidr_block="10.0.0.0/20",region="us-central1"}] */
/*
variable "setExample" {
    type = set(
        object({
            cidr_block = string
            region = string
        })
    )
}

output "setExample" {
    value = var.setExample
}
*/


/* Define variable block using the below mentioned unstructured data using set
["rohit","abraham",5] */

variable "setExample2" {
    type = set(any)
}

output "setExample2" {
    value = var.setExample2
}