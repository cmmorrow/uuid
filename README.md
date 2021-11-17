# uuid

A command-line tool for generating universally unique identifiers.

## Requirements

uuid is written in Elixir and will require Elixir > 1.10 if installed locally.

## Installation

### Docker

Run `docker build -t uuid .`
Verify uuid is installed properly by running `docker run -it --rm uuid --help`.

### Local

Start by cloning the repo at [https://github.com/cmmorrow/uuid](https://github.com/cmmorrow/uuid).

Run mix escript.build from the command line to build the uuid binary.
Verify uuid is installed properly by running `./uuid --help`.

## Usage

```text
Usage: uuid [1|3|4|5] [--url|--dns|--oid|--x500 name] [--hex|--urn]

  A command-line tool for generating universal unique identifiers (uuids).

  1 - Generate a version 1 uuid based on MAC address. 
  3 - Generate a version 3 uuid based on the MD5 hash of ARG.
  4 - Generate a version 4 uuid based on randomly generated bytes.
  5 - Generate a version 5 uuid based on the SHA1 hash of ARG.

  If a version number isn't provided, the default is version 4.

  Options:
    --url    A uniform resource locator.
    --dns    A fully qualified domain name.
    --oid    An object identifier.
    --x500   A x.500 distinguished name.

    --hex    Provides the uuid in hexidecimal format without the "-"s.
    --urn    Provides the uuid in the uniform resource name namespace.
```

## Examples

```text
> uuid
a88beae3-2989-4e80-938a-6d3bd0848189

> uuid 1
48dd6b58-4768-11ec-8aeb-xxxxxxxxxxxx

> uuid 3 --dns elixir-lang.org
8193d89e-bc38-3c0c-aca8-a9dcc3493799

> uuid 3 --dns elixir-lang.org --hex
8193d89ebc383c0caca8a9dcc3493799

> uuid 3 --url elixir-lang.org --urn
urn:uuid:c2f6bfdf-0011-3df9-a67f-faf9132e0185
```