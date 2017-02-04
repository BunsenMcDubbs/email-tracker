# email-tracker
invisible pixels to make your recipient's actions visible

## Overview

 1. User requests a new tracking code
 2. Server responds with an image tag
 3. User sends email with embedded tracking code
 4. Recipient opens email, their email Client requests the image from Server
 5. Server logs request and replies with an "invisible" pixel

## API

All routes are mounted at `/api/`

method route | name | description | params | response
----------------------------------------------
get `hello/:name` | hello world | says hi! | n/a | `hello <name>!`
post `tag/new` | new tag | create a new tag | n/a | `{ _id: UUID, url: URL (/api/tag/:_id/log) }`
get `tag/:id` | retrieve tag | get info about tag | n/a | `{ _id: UUID, url: URL, log: [{ timestamp: DATETIME, ip: IP_ADDR}]}`
get `tag/:id/log` | log tag | log a retrieval of a tag | n/a | invisible pixel
get `tag/` | get all tags | get a list of all tags | n/a | `{ tags: [{_id: UUID, url: URL} ... ] }`
