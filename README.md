# Features
- Can cache image as text anywhere (JSON, SQL, TXT)
- No need to upload anywhere
- So fast don't need to wait much to get that
- Standalone it doesn't use any function from anywhere
- Can make a mugshot from any ped, not just self player
- Optimize and get low usage (0.00 on idle and 0.01 on converting)
- Clean coding

# Resource preview
[Video](https://youtu.be/DHog499Fkkk)

# Requirements
- Brain

# Download & Installation

- Download https://github.com/BaziForYou/MugShotBase64/archive/main.zip
- Put it in the `resources` folder 

## Installation	
- Add this in your `server.cfg` in the following order:
```bash
start MugShotBase64
```

## Exports	
#### Client

| Export                         | Description                               | Parameter(s)  | Return type          |
|--------------------------------|-------------------------------------------|---------------|----------------------|
| GetMugShotBase64               | Returns base64 string                     | Ped Hanel, bool(Transpert)   | string |

##### Example

```lua
local MugShot = exports["MugShotBase64"]:GetMugShotBase64(PlayerPedId(), true)
```

# Credits
- [codegrepper](https://www.codegrepper.com/code-examples/javascript/convert+image+to+base64+using+javascript)
