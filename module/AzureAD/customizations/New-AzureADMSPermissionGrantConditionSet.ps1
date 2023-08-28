# ------------------------------------------------------------------------------
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
# ------------------------------------------------------------------------------
@{
    SourceName = "New-AzureADMSPermissionGrantConditionSet"
    TargetName = $null
    Parameters = $null
    Outputs = $null
    CustomScript = @"
    PROCESS {    
        `$params = @{}
        
        if(`$null -ne `$PSBoundParameters["PermissionType"])
        {
            `$params["PermissionType"] = `$PSBoundParameters["PermissionType"]
        }
        if(`$null -ne `$PSBoundParameters["PermissionClassification"])
        {
            `$params["PermissionClassification"] = `$PSBoundParameters["PermissionClassification"]
        }
        if(`$null -ne `$PSBoundParameters["ResourceApplication"])
        {
            `$params["ResourceApplication"] = `$PSBoundParameters["ResourceApplication"]
        }
        if(`$null -ne `$PSBoundParameters["Permissions"])
        {
            `$params["Permissions"] = `$PSBoundParameters["Permissions"]
        }
        if(`$PSBoundParameters.ContainsKey("Verbose"))
        {
            `$params["Verbose"] = `$Null
        }
        if(`$null -ne `$PSBoundParameters["ClientApplicationTenantIds"])
        {
            `$params["ClientApplicationTenantIds"] = `$PSBoundParameters["ClientApplicationTenantIds"]
        }
        if(`$PSBoundParameters.ContainsKey("Debug"))
        {
            `$params["Debug"] = `$Null
        }
        if(`$null -ne `$PSBoundParameters["PolicyId"])
        {
            `$params["PermissionGrantPolicyId"] = `$PSBoundParameters["PolicyId"]
        }
        if(`$null -ne `$PSBoundParameters["ConditionSetType"])
        {
            `$conditionalSet = `$PSBoundParameters["ConditionSetType"]
        }
        if(`$null -ne `$PSBoundParameters["ClientApplicationsFromVerifiedPublisherOnly"])
        {
            `$params["ClientApplicationsFromVerifiedPublisherOnly"] = `$PSBoundParameters["ClientApplicationsFromVerifiedPublisherOnly"]
        }
        if(`$null -ne `$PSBoundParameters["ClientApplicationPublisherIds"])
        {
            `$params["ClientApplicationPublisherIds"] = `$PSBoundParameters["ClientApplicationPublisherIds"]
        }
        if(`$null -ne `$PSBoundParameters["ClientApplicationIds"])
        {
            `$params["ClientApplicationIds"] = `$PSBoundParameters["ClientApplicationIds"]
        }
    
        Write-Debug("============================ TRANSFORMATIONS ============================")
        `$params.Keys | ForEach-Object {"`$_ : `$(`$params[`$_])" } | Write-Debug
        Write-Debug("=========================================================================``n")
        

        if("`$conditionalSet" -eq "includes"){
            `$response = New-MgPolicyPermissionGrantPolicyInclude @params
        }
        elseif("`$conditionalSet" -eq "excludes"){
            `$response = New-MgPolicyPermissionGrantPolicyExclude @params
        }
        else{
            Write-Error("Message: Resource not found for the segment '`$conditionalSet'.")
            return
        }
        
        
        `$response
        }
"@
}