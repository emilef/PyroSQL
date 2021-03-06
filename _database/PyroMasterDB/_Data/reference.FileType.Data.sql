SET IDENTITY_INSERT [reference].[FileType] ON 

INSERT [reference].[FileType] ([FileTypeId], [FileTypeCode], [FileTypeName], [FileTypeExtension], [CreatedDT]) VALUES (0, N'txt', N'Text file', N'.txt', CAST(N'2021-02-27T00:33:51.5666667' AS DateTime2))
INSERT [reference].[FileType] ([FileTypeId], [FileTypeCode], [FileTypeName], [FileTypeExtension], [CreatedDT]) VALUES (1, N'csv', N'CSV file', N'.csv', CAST(N'2021-02-27T00:33:51.8533333' AS DateTime2))
INSERT [reference].[FileType] ([FileTypeId], [FileTypeCode], [FileTypeName], [FileTypeExtension], [CreatedDT]) VALUES (2, N'json', N'JSON file', N'.json', CAST(N'2021-02-27T00:33:51.8966667' AS DateTime2))
INSERT [reference].[FileType] ([FileTypeId], [FileTypeCode], [FileTypeName], [FileTypeExtension], [CreatedDT]) VALUES (3, N'excel', N'Excel file', N'{.xls|.xlsx}', CAST(N'2021-02-27T00:33:51.9266667' AS DateTime2))
SET IDENTITY_INSERT [reference].[FileType] OFF
