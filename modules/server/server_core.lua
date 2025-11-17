PerformHttpRequest('https://raw.githubusercontent.com/grevef/versions/refs/heads/branch/versions.json', function(_, res)
    local updateName = "hbd_carrybike"
    local resName = GetCurrentResourceName()
    local resPrefix = "^3["..resName.."]^"
    print("^3-------------------- Honeybadger Development - Versjon Check --------------------")
    print(resPrefix.."1 Checking for updates...^7")
    if not res then print(resPrefix.."1Failed to check for updates^7") return end
    local result = json.decode(res)
    if result[updateName].version and GetResourceMetadata(resName, 'version', 0) ~= result[updateName].version then
        print(resPrefix.."1 New version ^3"..result[updateName].version.."^1 of the script is available^7")
        if result[updateName].changelog then
            print(resPrefix.."1 Changelog: ^3")
            local text = ""
            for _, log in ipairs(result[updateName].changelog) do
                print("- "..log)
            end
        end
        print(resPrefix.."1 You can download it from ^3 https://github.com/grevef/hbd_carrybike ^7")
    else 
        print(resPrefix.."2 You have the latest version of the script^7")
    end
    print("^3-------------------- Honeybadger Development - Versjon Check --------------------^7")
end)

CreateThread(function()
    local scriptName = GetCurrentResourceName()
    if scriptName ~= "hbd_carrybike" then
        if scriptName == 'hbd_carrybike-main' then
            print("^1----------------------------------------^7")
            print("^1FJERN -main FRA SCRIPT NAVN !!!^7")
            print("^1----------------------------------------^7")
        else
            print("^1----------------------------------------^7")
            print("^1SCRIPT MÅ HA NAVNET: hbd_carrybike !!!^7")
            print("^1----------------------------------------^7")
        end
    end
    print('hbd_carrybike v1.0.2')
end)