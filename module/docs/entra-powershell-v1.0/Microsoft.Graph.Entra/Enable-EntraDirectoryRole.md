---
external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version:
schema: 2.0.0
---

# Enable-EntraDirectoryRole

## SYNOPSIS
Activates an existing directory role in Microsoft Entra ID.

## SYNTAX

```
Enable-EntraDirectoryRole [-RoleTemplateId <String>] [-InformationAction <ActionPreference>]
 [-InformationVariable <String>] [<CommonParameters>]
```

## DESCRIPTION
The Enable-EntraDirectoryRole cmdlet activates an existing directory role in Microsoft Entra ID.

## EXAMPLES

### Example 1: Enable a directory role
```
# Retrieve the Template Role object for the Guest Inviter role 
$InviterRole = Get-EntraDirectoryRoleTemplate | Where-Object {$_.DisplayName -eq "Guest Inviter"}

# Inspect the $Inveoter variable to make sure we found the correct template role
$InviterRole

ObjectId                             DisplayName   Description
--------                             -----------   -----------
95e79109-95c0-4d8e-aee3-d01accf2d47b Guest Inviter Guest Inviter has access to invite guest users.

# Enable the Inviter Role
Enable-EntraDirectoryRole -RoleTemplateId $InviterRole.ObjectId

ObjectId                             DisplayName   Description
--------                             -----------   -----------
03618579-3c16-4765-9539-86d9163ee3d9 Guest Inviter Guest Inviter has access to invite guest users.
```

The first command gets an inviter role that has the display name Guest Inviter by using the Get-EntraDirectoryRoleTemplate (./Get-EntraDirectoryRoleTemplate.md)cmdlet. 
The command stores Guest Inviter in the $InviterRole variable.

The second command displays the contents of $InviterRole.

The final command enables the directory role in $InviterRole.

## PARAMETERS

### -InformationAction
Specifies how this cmdlet responds to an information event.
The acceptable values for this parameter are:

- Continue
- Ignore
- Inquire
- SilentlyContinue
- Stop
- Suspend

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: infa

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InformationVariable
Specifies a variable in which to store an information event message.

```yaml
Type: String
Parameter Sets: (All)
Aliases: iv

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RoleTemplateId
The ID of the Role template to enable

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraDirectoryRole]()

[Get-EntraDirectoryRoleTemplate]()
