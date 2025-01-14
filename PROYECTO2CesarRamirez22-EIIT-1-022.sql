USE [master]
GO
/****** Object:  Database [INNOV]    Script Date: 23/8/2023 18:25:17 ******/
CREATE DATABASE [INNOV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'INNOV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\INNOV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'INNOV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\INNOV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [INNOV] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [INNOV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [INNOV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [INNOV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [INNOV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [INNOV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [INNOV] SET ARITHABORT OFF 
GO
ALTER DATABASE [INNOV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [INNOV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [INNOV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [INNOV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [INNOV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [INNOV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [INNOV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [INNOV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [INNOV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [INNOV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [INNOV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [INNOV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [INNOV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [INNOV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [INNOV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [INNOV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [INNOV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [INNOV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [INNOV] SET  MULTI_USER 
GO
ALTER DATABASE [INNOV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [INNOV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [INNOV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [INNOV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [INNOV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [INNOV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [INNOV] SET QUERY_STORE = ON
GO
ALTER DATABASE [INNOV] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [INNOV]
GO
/****** Object:  Table [dbo].[CitasID]    Script Date: 23/8/2023 18:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitasID](
	[CitasID] [int] NOT NULL,
	[PacienteID] [int] NULL,
	[MedicoID] [int] NULL,
	[Fecha_Cita] [date] NULL,
	[Hora_Cita] [time](7) NULL,
 CONSTRAINT [PK_CitasID] PRIMARY KEY CLUSTERED 
(
	[CitasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultasID]    Script Date: 23/8/2023 18:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultasID](
	[ConsultasID] [int] NOT NULL,
	[PacienteID] [int] NULL,
	[MedicoID] [int] NULL,
	[Fecha_Consulta] [date] NULL,
	[Diagnostico] [varchar](100) NULL,
	[Tratamiento] [varchar](100) NULL,
 CONSTRAINT [PK_ConsultasID] PRIMARY KEY CLUSTERED 
(
	[ConsultasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FacturasID]    Script Date: 23/8/2023 18:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FacturasID](
	[FacturasID] [int] NOT NULL,
	[PacienteID] [int] NULL,
	[Fecha_Factura] [date] NULL,
	[Monto_Total] [decimal](10, 2) NULL,
 CONSTRAINT [PK_FacturasID] PRIMARY KEY CLUSTERED 
(
	[FacturasID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicosID]    Script Date: 23/8/2023 18:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicosID](
	[MedicosID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Especialidad] [varchar](50) NULL,
	[Correo_Electronico] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
 CONSTRAINT [PK_MedicosID] PRIMARY KEY CLUSTERED 
(
	[MedicosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pacienteID]    Script Date: 23/8/2023 18:25:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pacienteID](
	[PacienteID] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Genero] [varchar](10) NULL,
	[Direccion] [varchar](100) NULL,
 CONSTRAINT [PK_pacienteID] PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (1, 1, 1, CAST(N'2023-10-12' AS Date), CAST(N'08:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (2, 2, 2, CAST(N'2023-10-11' AS Date), CAST(N'09:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (3, 3, 3, CAST(N'2023-10-17' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (4, 4, 4, CAST(N'2023-10-25' AS Date), CAST(N'11:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (5, 5, 5, CAST(N'2023-10-30' AS Date), CAST(N'02:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (6, 6, 6, CAST(N'2023-10-01' AS Date), CAST(N'04:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (7, 7, 7, CAST(N'2023-10-09' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (8, 8, 8, CAST(N'2023-10-23' AS Date), CAST(N'12:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (9, 9, 9, CAST(N'2023-10-16' AS Date), CAST(N'03:00:00' AS Time))
INSERT [dbo].[CitasID] ([CitasID], [PacienteID], [MedicoID], [Fecha_Cita], [Hora_Cita]) VALUES (10, 10, 10, CAST(N'2023-10-12' AS Date), CAST(N'08:00:00' AS Time))
GO
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (1, 1, 1, CAST(N'2023-11-01' AS Date), N'Hipertension', N'Cambios en el estilo de vida')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (2, 2, 2, CAST(N'2023-11-02' AS Date), N'Gripe', N'Reposo')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (3, 3, 3, CAST(N'2023-11-03' AS Date), N'Fractura osea', N'yeso')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (4, 4, 4, CAST(N'2023-11-04' AS Date), N'Alergia', N'Antihistaminicos')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (5, 5, 5, CAST(N'2023-11-07' AS Date), N'Anemia', N'Suplementos de hierro')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (6, 6, 6, CAST(N'2023-11-08' AS Date), N'Diabetes', N'Cambios en la dieta')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (7, 7, 7, CAST(N'2023-11-10' AS Date), N'Migrana', N'Analgesicos')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (8, 8, 8, CAST(N'2023-11-15' AS Date), N'Neumonia', N'Antibioticos')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (9, 9, 9, CAST(N'2023-11-17' AS Date), N'Gastritis', N'Dieta Blanda')
INSERT [dbo].[ConsultasID] ([ConsultasID], [PacienteID], [MedicoID], [Fecha_Consulta], [Diagnostico], [Tratamiento]) VALUES (10, 10, 10, CAST(N'2023-11-30' AS Date), N'Depresion', N'Psicoterapia')
GO
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (1, 1, CAST(N'2023-11-01' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (2, 2, CAST(N'2023-11-11' AS Date), CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (3, 3, CAST(N'2023-11-18' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (4, 4, CAST(N'2023-11-22' AS Date), CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (5, 5, CAST(N'2023-11-25' AS Date), CAST(3500.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (6, 6, CAST(N'2023-11-29' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (7, 7, CAST(N'2023-11-30' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (8, 8, CAST(N'2023-11-07' AS Date), CAST(3000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (9, 9, CAST(N'2023-11-14' AS Date), CAST(2000.00 AS Decimal(10, 2)))
INSERT [dbo].[FacturasID] ([FacturasID], [PacienteID], [Fecha_Factura], [Monto_Total]) VALUES (10, 10, NULL, CAST(1500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (1, N'Dr.Ramirez', N'Cardiologia', N'Dr.ramirez@gmail.com', N'809-754-8789')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (2, N'Dr.Puello', N'Pediatria', N'Dr.Puello@gmail.com', N'809-876-9234')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (3, N'Dr.Mercedes', N'Dermatologia', N'Dr.Mercedes@gmail.com', N'809-543-7819')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (4, N'Dr.Gonzales', N'Ortopedia', N'Dr.Gonzales@gmail.com', N'809-189-9712')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (5, N'Dr.Germosen', N'Radiologia', N'Dr.Germosen@gmail.com', N'809-618-0100')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (6, N'Dr.Vladimir', N'Urologia', N'Dr.Vladimir@gmail.com', N'809-111-8726')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (7, N'Dr.Joel', N'Ginecologia', N'Dr.Joel@gmail.com', N'809-843-9817')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (8, N'Dr.leo', N'Psiquiatria', N'Dr.Leo@gmail.com', N'809-178-9876')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (9, N'Dra. Cesarina', N'Odontologia', N'Dra.Cesarina@gmail.com', N'809-761-1222')
INSERT [dbo].[MedicosID] ([MedicosID], [Nombre], [Especialidad], [Correo_Electronico], [telefono]) VALUES (10, N'Dra.Adriana', N'Farmacologia', N'Dra.Adriana@gmail.com', N'809-')
GO
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (1, N'cesar ramirez', CAST(N'1998-09-22' AS Date), N'M', N'Pantoja')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (2, N'licelos puello', CAST(N'1999-09-12' AS Date), N'F', N'Los alcarrizos ')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (3, N'joel ramirez', CAST(N'2003-12-19' AS Date), N'M', N'Piantini')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (4, N'cris gray', CAST(N'1992-04-26' AS Date), N'M', N'San Juan')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (5, N'jake paul', CAST(N'1998-11-30' AS Date), N'M', N'Azua')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (6, N'logan paul', CAST(N'2017-01-20' AS Date), N'M', N'Bani')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (7, N'juan pablo', CAST(N'2009-11-14' AS Date), N'M', N'Barahona')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (8, N'mario ruiz', CAST(N'1987-12-25' AS Date), N'M', N'Herrera')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (9, N'benito ocasio', CAST(N'1995-02-10' AS Date), N'M', N'Guaricanos')
INSERT [dbo].[pacienteID] ([PacienteID], [Nombre], [Fecha_Nacimiento], [Genero], [Direccion]) VALUES (10, N'nicolas perez', CAST(N'1999-05-02' AS Date), N'M', NULL)
GO
ALTER TABLE [dbo].[CitasID]  WITH CHECK ADD  CONSTRAINT [FK_CitasID_MedicosID] FOREIGN KEY([MedicoID])
REFERENCES [dbo].[MedicosID] ([MedicosID])
GO
ALTER TABLE [dbo].[CitasID] CHECK CONSTRAINT [FK_CitasID_MedicosID]
GO
ALTER TABLE [dbo].[CitasID]  WITH CHECK ADD  CONSTRAINT [FK_CitasID_pacienteID] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[pacienteID] ([PacienteID])
GO
ALTER TABLE [dbo].[CitasID] CHECK CONSTRAINT [FK_CitasID_pacienteID]
GO
ALTER TABLE [dbo].[ConsultasID]  WITH CHECK ADD  CONSTRAINT [FK_ConsultasID_MedicosID] FOREIGN KEY([MedicoID])
REFERENCES [dbo].[MedicosID] ([MedicosID])
GO
ALTER TABLE [dbo].[ConsultasID] CHECK CONSTRAINT [FK_ConsultasID_MedicosID]
GO
ALTER TABLE [dbo].[ConsultasID]  WITH CHECK ADD  CONSTRAINT [FK_ConsultasID_pacienteID] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[pacienteID] ([PacienteID])
GO
ALTER TABLE [dbo].[ConsultasID] CHECK CONSTRAINT [FK_ConsultasID_pacienteID]
GO
ALTER TABLE [dbo].[FacturasID]  WITH CHECK ADD  CONSTRAINT [FK_FacturasID_pacienteID] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[pacienteID] ([PacienteID])
GO
ALTER TABLE [dbo].[FacturasID] CHECK CONSTRAINT [FK_FacturasID_pacienteID]
GO
USE [master]
GO
ALTER DATABASE [INNOV] SET  READ_WRITE 
GO
