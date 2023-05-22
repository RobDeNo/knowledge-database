Property 	                            Syntax 	    R/RW 	    lDAPDisplayName
AccountExpirationDate 	                DateTime 	RW 	        accountExpires, converted to local time
AccountLockoutTime 	                    DateTime 	RW 	        lockoutTime, converted to local time
AccountNotDelegated 	                Boolean 	RW 	        userAccountControl (bit mask 1048576)
AllowReversiblePasswordEncryption 	    Boolean 	RW 	        userAccountControl (bit mask 128)
BadLogonCount 	                        Int32 	    R 	        badPwdCount
CannotChangePassword 	                Boolean 	RW 	        nTSecurityDescriptor
CanonicalName 	                        String 	    R 	        canonicalName
Certificates 	                        ADCollection RW 	    userCertificate
ChangePasswordAtLogon               	Boolean 	W 	        If pwdLastSet = 0
City 	                                String      RW 	        l
CN 	                                    String 	    R 	        cn
Company 	                            String 	    RW 	        company
Country 	                            String 	    RW 	        c (2 character abbreviation)
Created 	                            DateTime 	R 	        whenCreated
Deleted 	                            Boolean 	R 	        isDeleted
Department 	                            String 	    RW 	        department
Description 	                        String 	    RW 	        description
DisplayName 	                        String 	    RW 	        displayName
DistinguishedName 	                    String (DN) R 	        distinguishedName
Division 	                            String 	    RW 	        division
DoesNotRequirePreAuth 	                Boolean 	RW 	        userAccountControl (bit mask 4194304)
EmailAddress 	                        String  	RW 	        mail
EmployeeID 	                            String 	    RW 	        employeeID
EmployeeNumber 	                        String 	    RW	        employeeNumber
Enabled 	                            Boolean 	RW 	        userAccountControl (bit mask not 2)
Fax 	                                String 	    RW 	        facsimileTelephoneNumber
GivenName 	                            String 	    RW 	        givenName
HomeDirectory 	                        String 	    RW 	        homeDirectory
HomedirRequired 	                    Boolean 	RW 	        userAccountControl (bit mask 8)
HomeDrive 	                            String 	    RW 	        homeDrive
HomePage 	                            String 	    RW 	        wWWHomePage
HomePhone 	                            String 	    RW 	        homePhone
Initials 	                            String 	    RW 	        initials
LastBadPasswordAttempt 	                DateTime 	R 	        badPasswordTime, converted to local time
LastKnownParent 	                    String (DN) R 	        lastKnownParent
LastLogonDate 	                        DateTime 	R 	        lastLogonTimeStamp, converted to local time
LockedOut 	                            Boolean 	RW 	        msDS-User-Account-Control-Computed (bit mask 16)
LogonWorkstations 	                    String 	    RW 	        userWorkstations
Manager 	                            String (DN) RW 	        manager
MemberOf 	                            ADCollection R      	memberOf
MNSLogonAccount 	                    Boolean 	RW 	        userAccountControl (bit mask 131072)
MobilePhone 	                        String 	    RW 	        mobile
Modified 	                            DateTime 	R 	        whenChanged
Name 	                                String 	    R 	        cn (Relative Distinguished Name)
ObjectCategory 	                        String 	    R 	        objectCategory
ObjectClass 	                        String  	R 	        objectClass, most specific value
ObjectGUID 	                            Guid 	    R 	        objectGUID converted to string
Office          	                    String 	    RW 	        physicalDeliveryOfficeName
OfficePhone 	                        String 	    RW 	        telephoneNumber
Organization 	                        String 	    RW      	o
OtherName 	                            String 	    RW 	        middleName
PasswordExpired 	                    Boolean 	RW 	        msDS-User-Account-Control-Computed (bit mask 8388608) (see Note 1)
PasswordLastSet 	                    DateTime 	RW 	            pwdLastSet, local time
PasswordNeverExpires 	                Boolean 	RW 	        userAccountControl (bit mask 65536)
PasswordNotRequired 	                Boolean 	RW 	        userAccountControl (bit mask 32)
POBox 	                                String 	    RW 	        postOfficeBox
PostalCode 	                            String 	    RW 	        postalCode
PrimaryGroup 	                        String 	    R 	        Group with primaryGroupToken
ProfilePath 	                        String      RW 	        profilePath
ProtectedFromAccidentalDeletion 	    Boolean 	RW 	        nTSecurityDescriptor
SamAccountName 	                        String 	    RW 	        sAMAccountName
ScriptPath 	                            String 	    RW 	        scriptPath
ServicePrincipalNames 	                ADCollectionRW 	        servicePrincipalName
SID 	                                Sid 	     R 	        objectSID converted to string
SIDHistory 	                            ADCollection R 	        sIDHistory
SmartcardLogonRequired 	                Boolean 	RW 	        userAccountControl (bit mask 262144)
State 	                                String 	    RW 	        st
StreetAddress 	                        String 	    RW 	        streetAddress
Surname 	                            String 	    RW 	        sn
Title 	                                String 	    RW 	        title
TrustedForDelegation 	                Boolean 	RW 	        userAccountControl (bit mask 524288)
TrustedToAuthForDelegation          	Boolean 	RW 	        userAccountControl (bit mask 16777216)
UseDESKeyOnly 	                        Boolean 	RW 	        userAccountControl (bit mask 2097152)
UserPrincipalName 	                    String 	    RW 	        userPrincipalName

https://datatracker.ietf.org/doc/html/rfc3227#section-2.3highly dense magnetic tape

