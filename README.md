# README

For this challenge, we would like you to build a simple API that return information about workstations managed by our platform.

## Getting Started 

This project uses ruby-2.6.2.

1. Install ruby dependancies with `bundle install`
2. Run the webserver `bundle exec rails s`
3. Access the API on `http://localhost:3000`

We recommend using Postman to access the API.

## Step 1: Implement `/workstations/x` show API endpoint

A `Workstation` represents a cloud workstation. Workstations are assigned to one or more `User`s who can allowed to access the workstation.

Create an endpoint that will return the JSON representation of a `Workstation`, given a `Workstation``ID`. The response format should follow the JSON API spec.

The response format should follow the [JSON API spec](http://jsonapi.org/examples/)

The `Workstation` and `User` classes have already been defined and both include a DATA constant that contains the data about each record.

```json
/workstations/101
  
{
  "data": {
    "type": "workstation",
    "id": "101",
    "attributes": {
      "name": "Dave's workstation",
      "ipAddress": "192.168.1.1",
      "status": "running",
      "instanceType": "g3.4xlarge",
      "platform": "linux"
    },
    "relationships": {
      "users": {
        "data": [
          {
            "id": 101,
            "type": "user"
          }
        ]
      }
    }
  }
}
```

API allows you to include related entities, so the following request should return the following response:

```json
/workstations/101?include=users

{
  "data": {
    "type": "workstation",
    "id": "101",
    "attributes": {
      "name": "Dave's workstation",
      "ipAddress": "192.168.1.1",
      "status": "running",
      "instanceType": "g3.4xlarge",
      "platform": "linux"
    },
    "relationships": {
      "users": {
        "data": [
          {
            "id": 101,
            "type": "user"
          }
        ]
      }
    }
  },
  "included": [
    {
      "type": "user",
      "id": 101,
      "attributes": {
        "name": "Dave N.",
        "email": "dave@gmail.com"
      }
    }
  ]
}
```

### Step 2: Implement `/workstations` index API endpoint

Building on step 1, implement an endpoint that returns all workstations following the JSON API specification.

The `include` parameter should also work, returning each user that is related to the returned workstations.

```json
/workstations?include=users

{
  "data": [
    {
      "type": "workstation",
      "id": "101",
      "attributes": {
        "name": "Dave's workstation",
        "ipAddress": "192.168.1.1",
        "status": "running",
        "instanceType": "g3.4xlarge",
        "platform": "linux"
      },
      "relationships": {
        "users": {
          "data": [
            {
              "id": 101,
              "type": "user"
            }
          ]
        }
      }
    },
    {
      "type": "workstation",
      "id": "102",
      "attributes": {
        "name": "Simon's workstation",
        "ipAddress": "192.168.1.2",
        "status": "running",
        "instanceType": "g3.4xlarge",
        "platform": "linux"
      },
      "relationships": {
        "users": {
          "data": [
            {
              "id": 102,
              "type": "user"
            }
          ]
        }
      }
    }
  ],
  "included": [
    {
      "type": "user",
      "id": 101,
      "attributes": {
        "name": "Dave N.",
        "email": "dave@gmail.com"
      }
    },
    {
      "type": "user",
      "id": 102,
      "attributes": {
        "name": "Simon L.",
        "email": "simon@gmail.com"
      }
    }
  ]
}
```

Things to keep in mind:
* What should happen if an invalid Workstation ID is provided?
* What should happen if we pass an invalid `include` parameter
* How can we be sure that everything is working?

# Notes
* You can use any gems that you like, but don't use any library that actually solves the problem itself (e.g. `jsonapi-resources` or `fast-jsonapi` or `active_model_serializers`)
* This shouldn't take more than a few hours. If you don't have time to complete it, don't worry - we're much more interested in how you approach the problem.
* If you want to provide more background on how you would have completed the problem, or any other notes, please put them in a NOTES.md file at the root of the project.
* Use an app like Postman (https://www.getpostman.com/) to send requests to the API during development rather than using your browser.

## Submitting your solution

Clone the repo and make your changes locally. When ready to submit, zip up the project and send it back to us.

To avoid problems with attachments being blocked, either send the file with Dropbox or WeTransfer.
