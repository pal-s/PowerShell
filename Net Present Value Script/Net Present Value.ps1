<# 
    Title:     Calculator incorporating Net Present Value concept
    Author:    Sumit Pal
    HID:       H10006112
    Email:     asr.sumitpal92@gmail.com
    Date:       5-Oct-2020
    Description:    This script takes inputs from user and calculate the NPA based on the inputs.
                    It has two functions. Function NetPresentValue calculate the NPA and function NPV_UserInputs takes the inputs from user
                    and pass it to NetPresentValue.
    
    Equation:   NPV(xyz) = Z1/(1 + r)^1 + ... + Zt/(1 + r)^t - X0
#>

#Script Begins

<#this function has 3 parameters. $initialInvestment is for cash-inflow or Initial Inverstmennt.
  $cashFlow is an array that repesents cash-outflow in time or Z(t) where 't' is time.
  $discountRate is 'r' in the equation or Discount %.
#>
function NetPresentValue{

param([double]$initialInvestment,[double[]]$cashFlow,[float]$discountRate)

$discountRate = 1 + ($discountRate / 100) #simplifying expression to avoid repeative computation in loop.

$index = 1 #index for foreach loop
[double]$sum = $null

foreach($item in $cashFlow){
        
        $sum = $sum + $item/([math]::Pow($discountRate,$index++))
    }


return [math]::Round( $sum - $initialInvestment,2)

}

#function is to take values from user and pass it to the function NVP
function NPV_UserInputs{

Clear-Host

[double]$initInvest = Read-Host "Enter Initial Investment:`n"
 
[float]$rate = Read-Host "Enter Discount Rate Percentage`n"
[int]$years = Read-Host "Enter No of Cash Flow Years:`n"

[double[]]$yearlyCashFlow = New-Object double[] $years
 
[int]$count = 1
while($years -ne 0){

    $YearlyCashFlow[$count++ - 1] = Read-Host "Enter Cash Outflow for Year $count :`n"
    $years--
}
#calling the function and passing the values to compute the NVP.
$nVP = NetPresentValue -InitialInvestment $initInvest -CashFlow $yearlyCashFlow -DiscountRate $rate

Write-Host "Net Present Value is: " $nVP
}

#calling the function for user inputs.
NPV_UserInputs
# SIG # Begin signature block
# MIIQKQYJKoZIhvcNAQcCoIIQGjCCEBYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUkoJe4macDyG/fTNsZlotqNlP
# qWigggu7MIIDHjCCAgagAwIBAgIQHZfuL75ZqbZBGrC6f+UwdTANBgkqhkiG9w0B
# AQsFADAUMRIwEAYDVQQDDAlTdW1pdCBQYWwwHhcNMjAwOTI1MjM0NjU0WhcNMjEw
# OTI2MDAwNjU0WjAUMRIwEAYDVQQDDAlTdW1pdCBQYWwwggEiMA0GCSqGSIb3DQEB
# AQUAA4IBDwAwggEKAoIBAQDXqDCFMejtU0vzhq9nOBOmEukfhgsZDxYQBDyfknLY
# QAqW1t8CTCMQhnGmmkrWFf1m9VUJNc7NX9zj6Bugk7DL2F6v/pFEt17fcUFU4/+e
# Q0RQ40B5qBidk+rnnd/ayeZNkG4ZMNEfaKdwaAYmLt/VqTJh4YB2NjpcQp06pwhL
# rKL/yBM9Ftwkd99hKbX4Ola4JIKYVWRrX9QBLJDYSK9MFnMb4iY2sjMegr8VDEBX
# Wey9DkC0hG3JO4tRHD0f93PnIw4OraGoCm4ZlXv/BE1cyVLuHN0JmxsJpHxglJTz
# FjwdaD9nnR0Yr0x6E1C5epasy1jJXzyG18/LvywGQDufAgMBAAGjbDBqMA4GA1Ud
# DwEB/wQEAwIHgDATBgNVHSUEDDAKBggrBgEFBQcDAzAkBgNVHREEHTAbghloMTAw
# MDYxMTJAY2FuYWRhaGFuc29uLmNhMB0GA1UdDgQWBBR4SHZ+P8AefYzempvCmYvJ
# XC5TzDANBgkqhkiG9w0BAQsFAAOCAQEAe8qY1J+oXZWEAyArT0XwlzwJaDjzOBXX
# TU/cub9iF+w9ELq70SwOqp4Hc3Qa7jzKx47SJpEnmGaN/kngqyoBXDTD/a7SvG7F
# X01MzbZJbBYxNeeNEixk8kuem2tUYJjHj92nFGFeFqCOkKRVyz/989uXB8iIFuLE
# DXb6a4g1BMv8nA4aIdi6N6z00uF90DIglA5kF8munm4T1botanBUwuBqR35Ks1Ri
# EfA5FtbWfoetY2b0aCB49SGPyKxzruUnBvITCKEXWxbNYv42XMdQG5Zd1EqcJdCQ
# xkwvCfP+zS54VzKff0oe6kihry/6XxtoqQtQwzW4cAm5i609qIWDTzCCA+4wggNX
# oAMCAQICEH6T6/t8xk5Z6kuad9QG/DswDQYJKoZIhvcNAQEFBQAwgYsxCzAJBgNV
# BAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxFDASBgNVBAcTC0R1cmJhbnZp
# bGxlMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFFRoYXd0ZSBDZXJ0aWZpY2F0
# aW9uMR8wHQYDVQQDExZUaGF3dGUgVGltZXN0YW1waW5nIENBMB4XDTEyMTIyMTAw
# MDAwMFoXDTIwMTIzMDIzNTk1OVowXjELMAkGA1UEBhMCVVMxHTAbBgNVBAoTFFN5
# bWFudGVjIENvcnBvcmF0aW9uMTAwLgYDVQQDEydTeW1hbnRlYyBUaW1lIFN0YW1w
# aW5nIFNlcnZpY2VzIENBIC0gRzIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
# AoIBAQCxrLNJVEuXHBIK2CV5kSJXKm/cuCbEQ3Nrwr8uUFr7FMJ2jkMBJUO0oeJF
# 9Oi3e8N0zCLXtJQAAvdN7b+0t0Qka81fRTvRRM5DEnMXgotptCvLmR6schsmTXEf
# sTHd+1FhAlOmqvVJLAV4RaUvic7nmef+jOJXPz3GktxK+Hsz5HkK+/B1iEGc/8UD
# UZmq12yfk2mHZSmDhcJgFMTIyTsU2sCB8B8NdN6SIqvK9/t0fCfm90obf6fDni2u
# iuqm5qonFn1h95hxEbziUKFL5V365Q6nLJ+qZSDT2JboyHylTkhE/xniRAeSC9do
# hIBdanhkRc1gRn5UwRN8xXnxycFxAgMBAAGjgfowgfcwHQYDVR0OBBYEFF+a9W5c
# zMx0mtTdfe8/2+xMgC7dMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAYYWaHR0
# cDovL29jc3AudGhhd3RlLmNvbTASBgNVHRMBAf8ECDAGAQH/AgEAMD8GA1UdHwQ4
# MDYwNKAyoDCGLmh0dHA6Ly9jcmwudGhhd3RlLmNvbS9UaGF3dGVUaW1lc3RhbXBp
# bmdDQS5jcmwwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgEGMCgG
# A1UdEQQhMB+kHTAbMRkwFwYDVQQDExBUaW1lU3RhbXAtMjA0OC0xMA0GCSqGSIb3
# DQEBBQUAA4GBAAMJm495739ZMKrvaLX64wkdu0+CBl03X6ZSnxaN6hySCURu9W3r
# WHww6PlpjSNzCxJvR6muORH4KrGbsBrDjutZlgCtzgxNstAxpghcKnr84nodV0yo
# ZRjpeUBiJZZux8c3aoMhCI5B6t3ZVz8dd0mHKhYGXqY4aiISo1EZg362MIIEozCC
# A4ugAwIBAgIQDs/0OMj+vzVuBNhqmBsaUDANBgkqhkiG9w0BAQUFADBeMQswCQYD
# VQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29ycG9yYXRpb24xMDAuBgNVBAMT
# J1N5bWFudGVjIFRpbWUgU3RhbXBpbmcgU2VydmljZXMgQ0EgLSBHMjAeFw0xMjEw
# MTgwMDAwMDBaFw0yMDEyMjkyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMR0wGwYDVQQK
# ExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjE0MDIGA1UEAxMrU3ltYW50ZWMgVGltZSBT
# dGFtcGluZyBTZXJ2aWNlcyBTaWduZXIgLSBHNDCCASIwDQYJKoZIhvcNAQEBBQAD
# ggEPADCCAQoCggEBAKJjCzlEuLsjp0RJuw7/ofBhClOTsJjbrSwPSsVu/4Y8U1UP
# Fc4EPyv9qZaW2b5heQtbyUyGduXgQ0sile7CK0PBn9hotI5AT+6FOLkRxSPyZFjw
# FTJvTlehroikAtcqHs1L4d1j1ReJMluwXplaqJ0oUA4X7pbbYTtFUR3PElYLkkf8
# q672Zj1HrHBy55LnX80QucSDZJQZvSWA4ejSIqXQugJ6oXeTW2XD7hd0vEGGKtwI
# TIySjJEtnndEH2jWqHR32w5bMotWizO92WPISZ06xcXqMwvS8aMb9Iu+2bNXizve
# BKd6IrIkri7HcMW+ToMmCPsLvalPmQjhEChyqs0CAwEAAaOCAVcwggFTMAwGA1Ud
# EwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgeA
# MHMGCCsGAQUFBwEBBGcwZTAqBggrBgEFBQcwAYYeaHR0cDovL3RzLW9jc3Aud3Mu
# c3ltYW50ZWMuY29tMDcGCCsGAQUFBzAChitodHRwOi8vdHMtYWlhLndzLnN5bWFu
# dGVjLmNvbS90c3MtY2EtZzIuY2VyMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly90
# cy1jcmwud3Muc3ltYW50ZWMuY29tL3Rzcy1jYS1nMi5jcmwwKAYDVR0RBCEwH6Qd
# MBsxGTAXBgNVBAMTEFRpbWVTdGFtcC0yMDQ4LTIwHQYDVR0OBBYEFEbGaaMOShQe
# 1UzaUmMXP142vA3mMB8GA1UdIwQYMBaAFF+a9W5czMx0mtTdfe8/2+xMgC7dMA0G
# CSqGSIb3DQEBBQUAA4IBAQB4O7SRKgBM8I9iMDd4o4QnB28Yst4l3KDUlAOqhk4l
# n5pAAxzdzuN5yyFoBtq2MrRtv/QsJmMz5ElkbQ3mw2cO9wWkNWx8iRbG6bLfsund
# IMZxD82VdNy2XN69Nx9DeOZ4tc0oBCCjqvFLxIgpkQ6A0RH83Vx2bk9eDkVGQW4N
# sOo4mrE62glxEPwcebSAe6xp9P2ctgwWK/F/Wwk9m1viFsoTgW0ALjgNqCmPLOGy
# 9FqpAa8VnCwvSRvbIrvD/niUUcOGsYKIXfA9tFGheTMrLnu53CAJE3Hrahlbz+il
# MFcsiUk/uc9/yb8+ImhjU5q9aXSsxR08f5Lgw7wc2AR1MYID2DCCA9QCAQEwKDAU
# MRIwEAYDVQQDDAlTdW1pdCBQYWwCEB2X7i++Wam2QRqwun/lMHUwCQYFKw4DAhoF
# AKB4MBgGCisGAQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisG
# AQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcN
# AQkEMRYEFGIG5Ml4v/d3G813l/xidOiptN72MA0GCSqGSIb3DQEBAQUABIIBAKuR
# JnaSS1jijjFqjAqhgvwogjs5/nOy3Dxv6MPH4qD532Wt/NGtD8frl/1u+GcGziwN
# w7+TAuLL9+XbzI2GBkFZ0i5w6yldnBQrV04tb7QbSiV7N1tG8u4aZxr4HshjMhiQ
# 6p4gZjB2GW5IBrgXTHjTjVdJrjN3euR3b2qXMD2X6f5rDw3Eio2Dewu00xLO/e87
# LNQx/2hHg1fVRvFQU+1mfa3Ve9NYYefg5lMlt4KZuOoq5UJixPYz4TGWzWiY2RGS
# gWHu0CjMVVzU/8JjE1/IyxUV2FyQ3Svfwkn5jtGudO2pLJMQzb6bJ2TWw8habfqr
# mvwQX5jwOarJAKLC9mehggILMIICBwYJKoZIhvcNAQkGMYIB+DCCAfQCAQEwcjBe
# MQswCQYDVQQGEwJVUzEdMBsGA1UEChMUU3ltYW50ZWMgQ29ycG9yYXRpb24xMDAu
# BgNVBAMTJ1N5bWFudGVjIFRpbWUgU3RhbXBpbmcgU2VydmljZXMgQ0EgLSBHMgIQ
# Ds/0OMj+vzVuBNhqmBsaUDAJBgUrDgMCGgUAoF0wGAYJKoZIhvcNAQkDMQsGCSqG
# SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjAxMDA1MTQzMTQ3WjAjBgkqhkiG9w0B
# CQQxFgQUaEjBrOuns2tHwqroT/TNi7i1LU4wDQYJKoZIhvcNAQEBBQAEggEAB+DA
# l9n58h0ZkRVSzb0R77GKihnJ2XajvMLb/nBhoDExJyv9XDJdAnCZNfXIec+t9u2J
# 0iS+bzSbox5XUVA4yY4SXbRqpoz71atHyWXW+C8SWCxUhS7ePYh5dJxFFSMBpT9h
# rw/ZZN82Fzbe4AVY6bSqJ0o6FCJj/dR2dFmYkx2RQ3XKfkcAqJCG8NrxH0XnAvt4
# SuYHEJt7pasotbBLuhthMC2sukzsa5B0vc0cf5MNS2B7S9ALh8hzarcU/V8gSHNn
# 4UOU+zuke7PeCdvqglAJNdMaym/EC0bMJhJvylA6hsX2ZS8LBaoJEf4FtzpoXLk9
# r/p7i42kXdhoms6M6A==
# SIG # End signature block
