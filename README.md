# B2Bi Container External

This repository contains the Dockerfile and related scripts required to build B2Bi images, and run B2Bi as container.

IMPORTANT: Containerized deployment is available in preview-only mode, and is not meant for use in production environments.

**Note**: If you are cloning on a Windows computer, make sure your ***CRLF option*** is set to ***input***. For details, see [Configuring Git to handle line endings](https://docs.github.com/en/get-started/getting-started-with-git/configuring-git-to-handle-line-endings).

# Organizational information

This repository contains the following files and folders to be used as templates for the various ways to deploy B2Bi in a container:
* *cluster* – Use the templates in this folder to run B2Bi in a cluster configuration.

    **Note**: When installing in a cluster configuration, make sure that the *docker-compose.yml* file specifies different externally available ports for the nodes. For example, if the port for accessing the HTTPS UI for the first node is defined as 6443:6443, the port for accessing the HTTPS UI for the second node must be defined as 16443:6443.

* *singlenode* – Use the templates in this folder to run B2Bi in a single-node configuration.
* *src* – This folder contains the files used to build the container image.
* *Dockerfile* – This is the definition file for building the container image.

These templates are only compatible with B2Bi 2.6 UP2022-05 and higher.

# Default parameters

This section describes the parameters in the _Dockerfile_ and _docker-compose.yml_ files. The values can be a string, an integer, a boolean, or long.

|**Parameter**|**Value**|**Description**|
|:---|:---|:---|
|`ACCEPT_GENERAL_CONDITIONS`|String|Set to **Yes** to accept that the Axway Products and/or Services shall be governed exclusively by the Axway General Terms and Conditions, unless an agreement has been signed with Axway, in which case such agreement shall apply.<br>This parameter is required.<br>**Default value**: Not applicable.<br>**Note**: You have to manually change the value of this parameter in the yml files provided in this repository.|
|`B2BiSharedDirectory`|String|Specifies the location of the shared directory to store documents and other files.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeLicenseFile`|String|Specifies the location of the B2Bi license file.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeDatabaseType`|Integer|Specifies the database type to use.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeDBName`|String|Specifies the database name.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeDBServerName`|String|Specifies the URL of the database server.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeDBPort`|Long|Specifies the port where the database is available.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeDBUserName`|String|Specifies the username that B2Bi will use to connect to the database.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`InterchangeDBPassword`|String|Specifies the password that corresponds to the username.<br>This parameter is required and encoded.<br>**Default value**: Not applicable.|
|`InterchangeDBVerify`|Boolean|Specifies whether to verify the database connection.<br>This parameter is required.<br>**Default value**: Not applicable.|
|`x12LicenseSelection`|Integer|Specifies whether to install X12 libraries depending on the availability of an X12 license.<br>This parameter is optional.<br>**Default value**: `1`|
|`NumberOfCPUs`|Integer|Specifies the number of CPUs of your host machine (2, 4, 8, 12 or 16).The default value is 2.<br>This parameter is optional.<br>**Default value**: `0`|
|`IntegratorPortRange`|String|Specifies a range of ports in which the installer must allocate the required B2Bi ports.<br>This parameter is optional, and can be set only if `ConfigurePortRange` is set to `TRUE`.<br>**Default value**: `8832..10000`|
|`ConfigurePortRange`|Boolean|This parameter is optional.<br>**Default value**: `FALSE`|
|`EnableOnlineArchive`|Boolean|Specifies whether to create an online archiving task in the trading engine, so as to be able to view and manage message archives from the Document Tracker tool of the B2Bi System Manager.<br>This parameter is optional, and can be set only if `ConfigurePortRange` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`ONLINE_ARCHIVE_COUNT`|Long|Specifies the number of online archive tasks.<br>This parameter is optional, and can be set only if `EnableOnlineArchive` is set to `TRUE`.<br>**Default value**: `4`|
|`SYSMAN_COUNT`|Long|This parameter is optional, and can be set only if `EnableOnlineArchive` is set to `TRUE`.<br>**Default value**: `3`|
|`NUMBER_OF_PORTER_PORTS`|Long|Specifies the number of porter pool ports that must be used only for Processing Engines. This value can range from 300 to 3580.<br>This parameter is optional, and can be set only if `EnableOnlineArchive` is set to `TRUE`.<br>**Default value**: `300`|
|`MessageSizeLimit`|String|Specifies the message size limit for caching message content in memory.<br>This parameter is optional.<br>Default value: `16384`|
|`UseSentinel`|Boolean|Specifies whether to use Sentinel for B2Bi monitoring.<br>This parameter is optional.<br>**Default value**: `FALSE`|
|`EnableIntegratorTransports`|Boolean|Specifies whether to use one or more connectors in Integrator.<br>This parameter is optional.<br>Default value: `FALSE`|
|`UseMQ`|Boolean|Specifies whether to use the MQSeries connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`MQMode`|Integer|Specifies the mode for the MQSeries connector.<br>This parameter is optional, and can be set only if `UseMQ` is set to `TRUE`.<br>**Default value**: `0`|
|`UseWebEdi`|Boolean|Specifies whether to use the WebEDI connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseSAP`|Boolean|Specifies whether to use the SAP ALE connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseUnicode`|Boolean|Specifies whether to install the SAP ALE connector in unicode mode.<br>This parameter is optional, and can be set only if `UseSAP` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`SAPSelectPath`|Boolean|This parameter is optional, and can be set only if `UseSAP` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`SAPpath`|String|Specifies the location of the SAP libraries on your network.<br>This parameter is optional, and can be set only if `SAPSelectPath` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`UseMigrationConnectors`|Boolean|Specifies whether to make HTTP and FTP connectors available on the Partner side.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseFTP`|Boolean|Specifies whether to use the FTP connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseFile`|Boolean|Specifies whether to use the File connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseMapAsAService`|Boolean|Specifies whether to enable the REST APIs for listing and running maps.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseHTTP`|Boolean|Specifies whether to use the HTTP connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseEmail`|Boolean|Specifies whether to use the EMAIL connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseSecureTransport`|Boolean|Specifies whether to use the SecureTransport File connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`UseJMS`|Boolean|Specifies whether to use the JMS connector in Integrator.<br>This parameter is optional, and can be set only if `EnableIntegratorTransports` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`JMSConnectionFactoryName`|String|Specifies the connection factory name for the JMS connector.<br>This parameter is required, and can be set only if `UseJMS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`JMSInitialContextFactoryName`|String|Specifies the context factory name for the JMS connector.<br>This parameter is required, and can be set only if `UseJMS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`JMSProviderName`|String|Specifies the name of the JMS provider.<br>This parameter is required, and can be set only if `UseJMS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`JMSProviderURL`|String|Specifies the URL to be used for the JMS connector.<br>This parameter is required, and can be set only if `UseJMS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`UseDmlMaps`|Boolean|This parameter is optional.<br>**Default value**: `TRUE`|
|`UseEdifactBatchFiles`|Boolean|This parameter is optional.<br>**Default value**: `TRUE`|
|`UseFailSafeMode`|Boolean|This parameter is optional.<br>**Default value**: `TRUE`|
|`UseX12BatchFiles`|Boolean|This parameter is optional.<br>**Default value**: `TRUE`|
|`EnableMultiCluster`|Boolean|Specifies whether to configure a Multi-Cluster instance.<br>This parameter is optional.<br>**Default value**: `FALSE`|
|`MultiClusterSharedDirectory`|String|Specifies the location of the cluster's shared directory to store documents and other files.<br>This parameter is required, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`MULTICLUSTER`|String|This parameter is optional, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: `PROCESSING`|
|`MULTICLUSTER_INITIAL_DATA_SOURCE`|String|Specifies the source of the data to be synchronized across Multi-Cluster.<br>This parameter is optional, and can be set only if you have provided a value for `MULTICLUSTER`.<br>**Default value**: `relational`|
|`MULTICLUSTER_CLUSTER_IDENTIFIER`|String|Specifies a cluster identifier for the cluster that you are configuring.<br>This parameter is optional, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: `autogenerated`|
|`IgniteInstanceName`|String|Specifies the instance name for the Ignite server.<br>This parameter is required, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`IgniteTcpPortRange`|String|Specifies the TCP discovery port range for the Ignite server.<br>This parameter is optional, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: `49500..49520`|
|`IgniteJdbcPortRange`|String|Specifies the JDBC port range for the Ignite server.<br>This parameter is optional, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: `10800..10820`|
|`IgniteUsername`|String|Specifies the user name to be used for connection to Ignite.<br>This parameter is required, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`IgnitePassword`|String|Specifies the password to be used for connection to Ignite.<br>This parameter is required and encoded, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`IgnitePasswordConfirm`|String|Confirms the password to be used for connection to Ignite.<br>This parameter is required and encoded, and can be set only if you have provided a value for `IgnitePassword`.<br>**Default value**: Not applicable.|
|`IgniteEnableTLS`|Boolean|Specifies whether to enable TLS connections for Multi-Cluster.<br>This parameter is optional, and can be set only if `EnableMultiCluster` is set to `TRUE`.<br>**Default value**: `TRUE`|
|`TrustStoreLocation`|String|Specifies the location of the TLS TrustStore file.<br>This parameter is optional, and can be set only if `IgniteEnableTLS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`TrustStorePassword`|String|Specifies the password for the TLS TrustStore file.<br>This parameter is optional and encoded, and can be set only if `IgniteEnableTLS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`TrustStorePasswordConfirm`|String|Confirms the password for the TLS TrustStore file.<br>This parameter is required and encoded, and can be set only if you have provided a value for `TrustStorePassword`.<br>**Default value**: Not applicable.|
|`KeyStoreLocation`|String|Specifies the location of the TLS KeyStore file.<br>This parameter is optional, and can be set only if `IgniteEnableTLS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`KeyStorePassword`|String|Specifies the password for the TLS KeyStore file.<br>This parameter is optional and encoded, and can be set only if `IgniteEnableTLS` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`KeyStorePasswordConfirm`|String|Confirms the password for the TLS KeyStore file.<br>This parameter is required and encoded, and can be set only if you have provided a value for `KeyStorePassword`.<br>**Default value**: Not applicable.|
|`EnableUsageMetering`|Boolean|Starting with B2Bi 2.6 UP2022-05, this parameter has been replaced with `EnableUsageTracking`.|
|`EnableUsageTracking`|Boolean|Specifies whether to enable usage metering for the B2Bi system.<br>This parameter is optional.<br>**Default value**: `FALSE`|
|`MeteringContractVersion`|Integer|Specifies the type of contract.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: `1`|
|`MeteringEnvironmentID`|String|Specifies the ID of the environment defined on the Amplify Platform.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`EnableAmplifyUpload`|Boolean|Specifies whether to enable the automatic generation and upload of reports to the Amplify Platform.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: `FALSE`|
|`MeteringServiceAccountConfig`|String|Specifies the path to the JSON file with the service account configuration. This file must be downloaded from the Amplify Platform.<br>This parameter is optional, and can be set only if `EnableAmplifyUpload` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`MeteringAmplifyKey`|String|Specifies the path to the private key generated by the Amplify Platform.<br>This parameter is optional, and can be set only if `EnableAmplifyUpload` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`MeteringDBName`|String|Specifies the name of the usage tracking schema for all supported databases, except for Oracle.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`MeteringDBUserName`|String|Specifies the user name for the usage tracking schema for Oracle databases.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`MeteringDBPassword`|String|Specifies the password for the usage tracking schema for Oracle databases.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`MeteringDBPasswordConfirm`|String|Confirms the password for the usage tracking schema for Oracle databases.<br>This parameter is optional, and can be set only if `EnableUsageTracking` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`UseXFBGateway`|Boolean|Specifies whether to use the XFBGateway connector in Integrator.<br>This parameter is optional.<br>**Default value**: `FALSE`|
|`XFBGatewayDataExchangeDirPath`|String|Specifies the path to the directories used for data exchange between B2Bi and Gateway.<br>This parameter is optional, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`XFBGatewayGUIPort`|Long|Specifies the Gateway GUI port.<br>This parameter is optional, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: `54845`|
|`XFBGatewayIPAddress`|String|Specifies the IP address of the machine where Gateway is installed.<br>This parameter is optional, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: `1.1.11.1`|
|`XFBGatewayPassword`|String|Specifies the password that B2Bi uses to connect to Gateway.<br>This parameter is optional and encoded, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: Not applicable.|
|`XFBGatewayPasswordConfirm`|String|Confirms the password that B2Bi uses to connect to Gateway.<br>This parameter is required and encoded, and can be set only if you have provided a value for `XFBGatewayPassword`.<br>**Default value**: Not applicable.|
|`XFBGatewayProfileName`|String|Specifies the name of the Gateway profile.<br>This parameter is optional, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: `CSTCP`|
|`XFBGatewayTCPIPPort`|Long|Specifies the TCP/IP port that B2Bi uses to receive files and transfer notifications from Gateway.<br>This parameter is optional, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: `34892`|
|`XFBGatewayUser`|String|Specifies the user name that B2Bi uses to connect to Gateway.<br>This parameter is optional, and can be set only if `UseXFBGateway` is set to `TRUE`.<br>**Default value**: `admin`|

# B2Bi image - usage options

This section describes the advanced capabilities available when running B2Bi images.

|**Option**|**Description**|
|:---|:---|
|`-h`, `--help`|Entrypoint usage help.|
|`-v`, `--version`|Print B2Bi components version & build number.|
|`-i`, `--install`|Installs B2Bi default configuration based on the environment variables provided.|
|`-s`, `--start`|Starts B2Bi Server using the B2Bi start script.|
|`-e`, `--encode [PASSWORD]`|Encodes a clear text password.|
|`-w`, `--wait-for-it [HOST]:[PORT]`|Waits for a specific [HOST]:[PORT] entry before configuring and starting B2Bi Server.|
|`-t`, `--timeout [TIMEOUT]`|Timeout to wait for [HOST]:[PORT], in seconds.|
|`-D`, `--dockerfile`|Print used Dockerfile.|
|`-E`, `--envhelp`|Shows the environment variables documentation.|
|`-c`, `--before [COMMAND]`|Used to execute a custom command provided as string before B2Bi configuration and/or startup. Can be useful when extending this image.|
|`-d`, `--debug`|Run entrypoint in debug mode. Even if b2bi install/start will fail or be stopped the container stays up and running.|
|`-C`, `--after [COMMAND]`|Used to execute a custom command provided as string after B2Bi configuration and/or startup. Can be useful when extending this image.|
|`-T`, `--fail-timeout NUMBER [SUFFIX]`|Time to keep the container up if B2Bi installation/startup fails. '[SUFFIX]' can be `s` for seconds (default), `m` for minutes, `h` for hours or `d` for days.|

# Copyright

Copyright (c) 2022 Axway Software SA and its affiliates. All rights reserved.

# License

All files in this repository are licensed by Axway Software SA and its affiliates under the Apache License, Version 2.0, available at [http://www.apache.org/licenses/](http://www.apache.org/licenses/).
