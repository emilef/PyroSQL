SET IDENTITY_INSERT [access].[AzureBlobStorageCredential] ON 

INSERT [access].[AzureBlobStorageCredential] ([AzBlobCredentialID], [AzBlobCredentialName], [AzBlobSharedAccessCredential], [AzBlobCredentialScope], [CreatedDT]) VALUES (0, N'dummy', N'dummy', N'ALL', CAST(N'2021-01-24T14:11:40.5566667' AS DateTime2))
INSERT [access].[AzureBlobStorageCredential] ([AzBlobCredentialID], [AzBlobCredentialName], [AzBlobSharedAccessCredential], [AzBlobCredentialScope], [CreatedDT]) VALUES (1, N'acazdevelopmentblob', N'sv=2019-12-12&ss=btqf&srt=sco&st=2021-01-24T14%3A30%3A34Z&se=2025-12-31T21%3A59%3A00Z&sp=rwdflcup&sig=qGjMKw8w4PKJlVUhKq5IqKQR8e9a9QzeTM7vVWEESQ4%3D', N'StorageAccount', CAST(N'2021-01-24T14:47:31.2933333' AS DateTime2))
INSERT [access].[AzureBlobStorageCredential] ([AzBlobCredentialID], [AzBlobCredentialName], [AzBlobSharedAccessCredential], [AzBlobCredentialScope], [CreatedDT]) VALUES (2, N'acazdevelopmentblob-master', N'sv=2019-12-12&st=2021-01-24T14%3A32%3A59Z&se=2025-12-31T21%3A59%3A00Z&sr=c&sp=racwdlt&sig=O%2BoXaoNCsSBY769%2BYSkKGzAAs%2FnlJQPHwwD1yc1PSm4%3D', N'BlobContainer', CAST(N'2021-01-24T14:48:49.2533333' AS DateTime2))
SET IDENTITY_INSERT [access].[AzureBlobStorageCredential] OFF
GO
