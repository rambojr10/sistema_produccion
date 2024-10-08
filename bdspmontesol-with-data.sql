USE [master]
GO
/****** Object:  Database [bdspmontesol]    Script Date: 13/03/2021 8:21:03 ******/
CREATE DATABASE [bdspmontesol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdspmontesol', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\bdspmontesol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdspmontesol_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\bdspmontesol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bdspmontesol] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdspmontesol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdspmontesol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdspmontesol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdspmontesol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdspmontesol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdspmontesol] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdspmontesol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdspmontesol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdspmontesol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdspmontesol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdspmontesol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdspmontesol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdspmontesol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdspmontesol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdspmontesol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdspmontesol] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bdspmontesol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdspmontesol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdspmontesol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdspmontesol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdspmontesol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdspmontesol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdspmontesol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdspmontesol] SET RECOVERY FULL 
GO
ALTER DATABASE [bdspmontesol] SET  MULTI_USER 
GO
ALTER DATABASE [bdspmontesol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdspmontesol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdspmontesol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdspmontesol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bdspmontesol] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bdspmontesol', N'ON'
GO
ALTER DATABASE [bdspmontesol] SET QUERY_STORE = OFF
GO
USE [bdspmontesol]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [bdspmontesol]
GO
/****** Object:  User [usermontesol]    Script Date: 13/03/2021 8:21:03 ******/
CREATE USER [usermontesol] FOR LOGIN [usermontesol] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[TblCajasMercadoNacional]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCajasMercadoNacional](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCajasPlataforma]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCajasPlataforma](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblMercadoNacional] [int] NOT NULL,
	[DedoSuelto] [int] NULL,
	[Cluster] [int] NULL,
	[ManoEntera] [int] NULL,
	[Especial] [int] NULL,
	[Bolsa20Kilos] [int] NULL,
	[Bolsa25Kilos] [int] NULL,
	[Total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCajasProduccion]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCajasProduccion](
	[PKCodigo] [varchar](5) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[FactorConversion] [float] NOT NULL,
	[FKId_TblTipoFruta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCargue]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCargue](
	[PKId_Cargue] [int] IDENTITY(1,1) NOT NULL,
	[FKIbm_TblFincas] [varchar](5) NOT NULL,
	[Cliente] [varchar](200) NOT NULL,
	[Fecha_Cargue] [date] NOT NULL,
	[N_Poma] [varchar](5) NOT NULL,
	[DedoSuelto] [int] NULL,
	[Cluster] [int] NULL,
	[ManoEntera] [int] NULL,
	[Especial] [int] NULL,
	[Bolsa20Kilos] [int] NULL,
	[Bolsa25Kilos] [int] NULL,
	[Total] [int] NULL,
	[Placa_Vehiculo] [varchar](8) NOT NULL,
	[Conductor] [varchar](200) NOT NULL,
	[FKCod_TblEmbarque] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId_Cargue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCintas]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCintas](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDet_TblDet_TblProduccion]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDet_TblDet_TblProduccion](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblDet_TblProduccion] [int] NOT NULL,
	[FKCodigo_TblCajasProduccion] [varchar](5) NOT NULL,
	[N_CajasProducidas_Dia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDet_TblDet_TblRacimos_TblDias]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDet_TblDet_TblRacimos_TblDias](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblDet_TblRacimos_TblDias] [int] NOT NULL,
	[FKId_TblCintas] [int] NOT NULL,
	[N_RacimosC_Cintas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDet_TblEmbarque]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDet_TblEmbarque](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKCod_TblEmbarque] [varchar](10) NOT NULL,
	[FKIbm_TblFincas] [varchar](5) NOT NULL,
	[FKCodigo_TblCajasProduccion] [varchar](5) NOT NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDet_TblMercadoNacional]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDet_TblMercadoNacional](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblMercadoNacional] [int] NOT NULL,
	[FKId_TblDias] [int] NOT NULL,
	[FKId_TblCajasMercadoNacional] [int] NOT NULL,
	[Cantidad_Elaborado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDet_TblProduccion]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDet_TblProduccion](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblProduccion] [int] NOT NULL,
	[FKId_TblDias] [int] NOT NULL,
	[Total_CE_Dia] [int] NULL,
	[Total_CR_Dia] [int] NULL,
	[Total_CEx_Dia] [int] NULL,
	[Ratio] [float] NULL,
	[Merma] [float] NULL,
	[Peso_Racimos] [float] NULL,
	[Area_Recorrida] [float] NULL,
	[Peso_Vastago] [float] NULL,
	[Lotes_Cortados] [varchar](50) NULL,
	[Lotes_Iniciados] [varchar](50) NULL,
	[Fruta_Piso] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDet_TblRacimos_TblDias]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDet_TblRacimos_TblDias](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblRacimos] [int] NOT NULL,
	[FKId_TblDias] [int] NOT NULL,
	[N_RacimosC_Dia] [int] NOT NULL,
	[N_RacimosR_Dia] [int] NOT NULL,
	[Total_PEmbarque] [int] NOT NULL,
	[Total_POtrasFincas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDias]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDias](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmbarque]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmbarque](
	[PKCod] [varchar](10) NOT NULL,
	[FKId_TblSemanas] [int] NOT NULL,
	[Anho] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKCod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmbolse]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmbolse](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblSemanas] [int] NOT NULL,
	[N_PlantasPresente] [int] NOT NULL,
	[N_PlantasPrematuro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmpresas]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmpresas](
	[PKNit] [varchar](11) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKNit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEstadoUsuario]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEstadoUsuario](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEstimativo]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEstimativo](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Finca] [varchar](50) NOT NULL,
	[Premiun] [int] NULL,
	[Especial] [int] NULL,
	[FKCod_TblEmbarque] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblFincas]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblFincas](
	[PKIbm] [varchar](5) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Area_Neta] [float] NOT NULL,
	[Area_Bruta] [float] NOT NULL,
	[FKNit_TblEmpresas] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKIbm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblLotes]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblLotes](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Lote] [varchar](20) NOT NULL,
	[Area_Neta] [float] NOT NULL,
	[Area_Bruta] [float] NOT NULL,
	[FKIbm_TblFincas] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMercadoNacional]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMercadoNacional](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Total_Elaborado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProduccion]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProduccion](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKIbm_TblFincas] [varchar](5) NOT NULL,
	[FKId_TblEmbolse] [int] NOT NULL,
	[FKId_TblRacimos] [int] NOT NULL,
	[FKId_TblSemanas] [int] NOT NULL,
	[FKId_TblMercadoNacional] [int] NULL,
	[Cod_Embarque] [varchar](10) NOT NULL,
	[Total_CElaboradas] [int] NULL,
	[Total_CREchazadas] [int] NULL,
	[Total_CExportadas] [int] NULL,
	[Ratio] [float] NULL,
	[Merma] [float] NULL,
	[Peso_Racimos] [float] NULL,
	[Area_Recorrida] [float] NULL,
	[Peso_Vastago] [float] NULL,
	[Anho_Produccion] [varchar](5) NOT NULL,
	[Fruta_Piso] [int] NULL,
	[Conversion] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRacimos]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRacimos](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[FKId_TblSemanas] [int] NOT NULL,
	[N_RacimosC] [int] NOT NULL,
	[N_RacimosR] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRegistroSemanas]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRegistroSemanas](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Anho_generado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSemanas]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSemanas](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[N_Semana] [varchar](50) NULL,
	[Fecha_Inicio] [date] NULL,
	[Fecha_Fin] [date] NULL,
	[Anho] [int] NOT NULL,
	[FKId_TblCintas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTipoFruta]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTipoFruta](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTipoUsuario]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTipoUsuario](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUsuarios]    Script Date: 13/03/2021 8:21:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUsuarios](
	[PKId] [int] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Ibm_Finca] [varchar](5) NULL,
	[FKId_TblTipoUsuario] [int] NOT NULL,
	[FKId_TblEstadoUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PKId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblCajasMercadoNacional] ON 

INSERT [dbo].[TblCajasMercadoNacional] ([PKId], [Descripcion]) VALUES (1, N'DEDO SUELTO CARTÓN')
INSERT [dbo].[TblCajasMercadoNacional] ([PKId], [Descripcion]) VALUES (2, N'CLUSTER CARTÓN')
INSERT [dbo].[TblCajasMercadoNacional] ([PKId], [Descripcion]) VALUES (3, N'MANO ENTERA')
INSERT [dbo].[TblCajasMercadoNacional] ([PKId], [Descripcion]) VALUES (4, N'DEDO SUELTO EN BOLSA DE 20KLS')
INSERT [dbo].[TblCajasMercadoNacional] ([PKId], [Descripcion]) VALUES (5, N'FRUTA DE PISO BOLSA DE 25KLS')
INSERT [dbo].[TblCajasMercadoNacional] ([PKId], [Descripcion]) VALUES (6, N'CANASTAS SUCIAS')
SET IDENTITY_INSERT [dbo].[TblCajasMercadoNacional] OFF
GO
SET IDENTITY_INSERT [dbo].[TblCajasPlataforma] ON 

INSERT [dbo].[TblCajasPlataforma] ([PKId], [FKId_TblMercadoNacional], [DedoSuelto], [Cluster], [ManoEntera], [Especial], [Bolsa20Kilos], [Bolsa25Kilos], [Total]) VALUES (3, 5018, 89, 5, 0, 0, 0, 0, 94)
SET IDENTITY_INSERT [dbo].[TblCajasPlataforma] OFF
GO
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'100', N'FRUTA PRIMERA BANAFRESK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1003', N'PR ORSERO BANANAS --', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1010', N'PR TURBANA 3 LBS BAN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1011', N'FT TESCO*', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1014', N'FLO FAIR TRADE EU***', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1015', N'FT JS FAIR TRADE 17K', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1016', N'FT 14 KLS- 75 DEDOS*', 0.77, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1017', N'FT FLO FAIR TRADE EU', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1019', N'FT TESCO 17 KG EU**', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1020', N'FT SMALL 13 KG*', 0.7, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1021', N'FT TESCO 17 KG CLUSTER BAG', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1025', N'FT FAIR T 3LB EEUU', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1028', N'FAIR TRADE TROPY DED', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1036', N'PRIMERA BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1041', N'PIMERA MIX SIMBA BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1043', N'PR BAHIA HD SIN SELLO  54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1044', N'MIX SIMBA BANANAS 5', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1046', N'PREMIUM TROPY HD 54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1047', N'PREMIUM ADRIA BANANA ', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1048', N'SEGUNDA DARIEN BVC 54 (SEGUNDA)', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1051', N'MENOR ESPECIFICACION  - BANANAS X 54', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1054', N'PR DM EUROMINI 17KG', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1056', N'PR 14 KL EU 75 DEDOS', 0.77, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1059', N'PR LD17 TRIAL 2', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1062', N'FT JSFTX5 17 K EU', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1073', N'PR SUPREME BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1075', N'PR LD17 AL 55', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1078', N'ME FREDY F BAG 13 KG ', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1079', N'ME FYFFES 12.7 KGS (SEGUNDA).', 0.7, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1080', N'ME ALDI BAG 1B 13 KGS.', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1081', N'SEGUNDA FT SMALL 12.7 KG EU*', 0.7, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1085', N'PR FRUTIA BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1089', N'PR TROPY MEDITERRAN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1103', N'PR DERBY BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1106', N'SEGUNDA DARIEN BVC 54', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1107', N'MENOR ESPECIFICACION - BANANAS AL 54', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1108', N'PR TURBANA RAINFOREST', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1114', N'PR  LD17RA  KGS.', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1120', N'PR FYFFES STDW 54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1124', N'DARIEN 54 RAINFORES', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1125', N'PR TURBANA 3 LBS BA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1126', N'PR FYFFES USA.', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1129', N'PR FYFFES MED 54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1133', N'PR MOR5STD - 54', 0.92, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1137', N'PR CHIQUITA BANAVAC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1138', N'DARIEN BVC RAINFORE', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1140', N'SEGUNDA CUMBIA BANANAS 54', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1141', N'SEGUNDA CUMBIA HD BANANAS 4', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1142', N'SEGUNDA CUMBIA HD BANANAS 5', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1143', N'SEGUNDA ME HAPPY BANANAS BV', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1148', N'SEGUNDA ME SLOBANA', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1149', N'STDRA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1153', N'PR DERBY - 48', 0.77, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1154', N'MIX DARIEN BANANA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1155', N'PR SUPREME SARL', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1163', N'PR SUPREME MEDITERR', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1165', N'PR DERBY BANANAS 48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1166', N'ME ALDI BAG 13 KGS.', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1167', N'FT JSFTX5 17 K EU -', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1168', N'PRIMERA MIX TROPY RA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1170', N'PR TURBANA RAINFOREST -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1171', N'PR FYFFES STDHD RAI', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1186', N'MIX ORSERO 41.5 LB', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1189', N'FT JS FAIR TRADE 17', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1191', N'PR FYFFES SRDHD 18.14 K', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1192', N'PR FYFFES FYFMED 18.14 K', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1193', N'PR FYFFES STDHDRA 18.14 K. RAIN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1194', N'PR CHIQUITA RAC BAN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1195', N'MIX ORSERO 41.5 LB -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1196', N'PR ORSERO RA 8.5 KG', 0.47, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1198', N'PR CLUSTER BAG FYFF', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1200', N'ME ALDI BAG RA 13 K', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1202', N'SEGUNDA ME ALDI BAG RA 13 K', 0.74, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1209', N'FT MHFT17 - EU-55', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1214', N'PR MOR5STDRA - 54', 0.92, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1215', N'ME FYFFES 12.7 KGS.', 0.7, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1216', N'PR MSTDRA - 54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1219', N'PR FYFFES 3 LBS BAN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1223', N'PR YELLOW RAINFORES', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1224', N'PR YELLOW RAINFORES ', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1225', N'PR PAMELA BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1231', N'FT TROPY EU - 48', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1233', N'PR FYFFES STDWR 54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1239', N'DARIEN BVC*', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1242', N'DARIEN 54*', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1243', N'DARIEN BVC 54*', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1253', N'PR ALDI RAINFOREST', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1255', N'MIX TROPY RAINFORES 17 KLOS', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1259', N'PR CHIQUITA RAC BANAVAC 54 REF', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1268', N'PR CHIQUITA RAC BAN -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1271', N'FT FT22X5 EU*', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1278', N'MENOR ESPECIFICACION FYFFES 13 KL CLUSTER BAG', 0.7, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1283', N'PR DERBY BANANAS -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1285', N'PR DERBY BANANAS RA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1287', N'PR ORSERO EUROMINI 17 KGS', 0.95, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1290', N'FT PLUSFT5', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1292', N'PR YELLOW RAINFOREST MOTTED', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1298', N'FT JSFTIF17 - 55 EU', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1303', N'MENOR ESPECIFICACION DEDO SUELTO 10 LBS.', 0.25, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1304', N'PR ORSERO BANANAS', 1, 1)
GO
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1313', N'FT - MHFTF517 - 55 EU', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1316', N'FT - DELMONTE - 54 EU', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1320', N'SEGUNDA BANAKING BVC - 54', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1324', N'PR GOODFARMER 4 HANDS 13.5 K', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1327', N'PR GOODFARMER 6 HANDS 13.5 K', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1328', N'PR GOODFARMER 5 HANDS 13.5 K', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1329', N'FT TROPY 17 KGS - 55 EU', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1333', N'PR GOODFARMER 5 HANDS 13.5 K -', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1336', N'PR BANANAS KRAFT SIN SELLO - 5', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1337', N'ME SHORT FRANCE', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1339', N'ME BANANEN EVERYDAY', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1341', N'MENOR ESPECIFICACION - BANANAS 5 DEDOS', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1342', N'MENOR ESPECIFICACION ME SIMBARICA 6 DEDO', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1345', N'PR BAHIA HD RAINFOREST', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1349', N'PR ORSERO RA EUROMI', 0.47, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1350', N'FT DELMONTE 17 KGS-EU-55', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1351', N'MENOR ESPECIFICACION YUMMYBAN UCRANIA BANANAS 54', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1353', N'FT JS - FAIR TRADE 17K EU - 55', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1354', N'FT JSFTX5 17 K EU -55', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1355', N'FT JS FAIR TRADE 17K JSFTB13K', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1356', N'MHFT17-EU-55', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1357', N'FT DELMONTE 17 KGS-EU-55 -', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1359', N'MENOR ESPECIFICACION - YUMMYBAN UCRANIA BA', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1361', N'ME YUMMYBAN UCRANIA BANANAS *54', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1368', N'BANAKING BVC - 48', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1377', N'FT PLFTMH18 - 54EU', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1396', N'ME RAINFOREST', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1425', N'FT TROPY FAIRGLOBE', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1436', N'PR CLUSTER BAG 10 B', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1460', N' ME CLUSTER BAG 2+3', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'1461', N'PR FYFFES CHEPP USA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'200', N'CLUSTER BAG DEDO SUELTO LARGO KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'354', N'PRIMERA NORMAL TROPICAL  EDEN EUROBOX KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'376', N'PREMIUM BANANAS EN BAG PALLET EUROPA URA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'392', N'MENOR ESPECIFICACION CLUSTER BAG QUAD PACK KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'426', N'TROPICAL EDEN EUROBOX 80*120', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'462', N'SEGUNDA DARIEN BVC 20 KLOS', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'474', N'SELECT SUN SWEET', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'489', N'PREMIUM TURBANA ECUADOR', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'494', N'PRIMERA NORMAL IRANI ESTRELLA KILOS 20', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'511', N'13 KLS MANOS TURBANA KILOS', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'512', N'PRIMERA NORMAL FYFFES EUROBOX KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'519', N'SEVEN BBANANAS PACK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'528', N'PR FYFF EUBOX 20 K45', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'534', N'PRIMERA NORMAL TURBANA PALLET KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'538', N'PRIMERA NORMAL FYFFES 20 KILOS KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'540', N'PRIMERA NORMAL BLANCOS BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'542', N'FREDY FYFFES 20 KL BAG KILOS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'545', N'PRIMERA NORMAL FYFFES CL B 48 KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'550', N'PR TURBANA EUROPA 18.14 KG - 48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'552', N'1B FREDY FYFFES BAG 22 18.14 KG - 48 SM', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'553', N'PR FYFFES STD 18.14 KG -48 SM', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'554', N'SEVEN BANANAS PACK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'559', N'CLUSTERT BAG 12X1 KG EXPOCARIBE', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'562', N'PRIMERA NORMAL IRANI FRUTTIA KILOS 20', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'568', N'DOLE USA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'574', N'FLO FT EUROPA 18.14 KG - FT', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'575', N'DARIEN KILOS', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'584', N'PRIMERA NORMAL STOP AND SHOP KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'587', N'PRIMERA NORMAL BONI BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'589', N'PRIMERA NORMAL DON CARLOS KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'595', N'13 KLS MANO ENTER EXPOCA-56', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'601', N'SEVEN BANANAS BLANCO BAG -48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'603', N'1B 7-BANANAS BLANCO BAG 22 18.14 KG SM -48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'604', N'CLUSTER BAG DOLPHIN BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'608', N'PRIMERA NORMAL TURBANA PREMIUM KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'609', N'PRIMERA CLUSTER BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'610', N'PRIMERA NORMAL FIVE A DAY PREMIUM KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'611', N'PRIMERA NORMAL PRICE CHOPPER KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'612', N'KORA KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'613', N'PRIMERA NORMAL PREMIUM TROPY KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'614', N'SEGUNDA DARIEN ESTÁNDAR KILOS 20', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'615', N'DARIEN BAG (SEGUNDA)', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'616', N'SEGUNDA DARIEN 3 LIBRAS KILOS 17', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'617', N'PRIMERA NORMAL WEISS PREMIUM KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'618', N'PRIMERA NORMAL UNIFRUIT KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'619', N'PRIMERA NORMAL TURBANA SPOT KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'620', N'PRIMERA NORMAL GIOIA KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'621', N'PRIMERA NORMAL COMACO KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'624', N'PRIMERA DOLE USA  KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'625', N'PRIMERA NORMAL SHURFINE PREMIUM KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'626', N'PREMIUM FAIR TRADE USA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'627', N'CLUSTER BAG FREDY FYFFES 13 KL BAG KILOS 13', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'629', N'PRIMERA NORMAL FAIR TRADE BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'630', N'PRIMERA NORMAL ANITA PREMIUM KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'631', N'1B FREDY FYFFES BAG 16 13 KG SM - 60', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'637', N'PRIMERA NORMAL FYFFES EUROBOX CHEP KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'638', N'PRIMERA NORMAL DOLE PREMIO POLYPAC KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'642', N'CLUSTER BAG FYFFES 13 KLS CLUSTER KILOS 13', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'645', N'PRIMERA NORMAL FYFFES BAG BLANK KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'649', N'DECO BAG KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'650', N'FREDDY FYFFES USA', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'654', N'CLUSTER BAG DEDO SUELTO CORTO KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'655', N'NATURAL TASTY INV. KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'656', N'PRIMERA NORMAL PREMIUM HOYA EUROBOX KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'657', N'PR FYFFES 12.7K -60 SM', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'658', N'PR FYFFE BAG BLANCO 18.14K SM - 48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'660', N'PR BONI BAG 18.14K SM-48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'661', N'PR FYFFES PRINTED BAG SM-48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'663', N'FYFFES SMOLL BAG KILOS', 0.71, 1)
GO
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'665', N'TURBANA 5 LIBRAS KILOS 20', 0.14, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'667', N'PRIMERA NORMAL DELMONTE ITALIANO KILOS 21', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'668', N'PR BANASUN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'669', N'PRIMERA NORMAL DISNEY PREMIUM KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'670', N'PR HOYA 12.7 KG SM -60', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'673', N'PRIMERA NORMAL PREMIUM HOYA ESTÁNDAR KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'674', N'FYFFES HD  KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'675', N'JS FAIR TRADE 17 KG EU-50', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'676', N'SAINSBURY EUROPA KILOS', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'678', N'FYFFES 13KL C BAG UK KILOS', 0.72, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'679', N'PRIMERA NORMAL TURBANA PRMIUN KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'681', N'PR ASDA CHEP 17 K', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'682', N'PRIMERA NORMAL PR TURBANA HD KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'683', N'PRIMERA NORMAL FYFFES HD  KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'685', N'CLUSTER BAG JUNIOR DISNEY KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'686', N'PRIMERA NORMAL  DIAMANTE HD KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'687', N'CHIQUITA BANAVACK EUROPALLET', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'688', N'CLUSTER BAG DISNEY PREMIUN BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'689', N'PRIMERA NORMAL FRUIT DU MONDE KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'690', N'PRIMERA NORMAL ASDA  KILOS 17', 0.95, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'691', N'JS FAIRTRADE 17K SM - 55', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'692', N'CLUSTER BAG BLANCO 7 18.14 KGS KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'693', N'PRIMERA NORMAL TURBANA BANA FRESH KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'694', N'PRIMERA MED STDHD NORMAL FYFFES KILOS 20 SIN SELLO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'695', N'PR TURBANA HANDS 13K SM - 56', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'696', N'CLUSTER BAG COOP 7 KILOS 13', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'698', N'PRFYFFES STD 18.14 K ALTA VENTILACIÓN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'699', N'PRIMERA NORMAL RIO GRANDE  KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'700', N'RACIMO BANANO ENMEPADO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'701', N'FAIR TRADE 12 KG-SM', 0.66, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'702', N'FLO FT EUROPA 18.14 KG - FT -', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'703', N'ORGANICO BAG NAKED', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'704', N'FAIR TRADE 13 KG-UR', 0.72, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'705', N'PR BANANEC MEDIT EURO KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'706', N'PR BANANEC MEDIT PAL KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'707', N'FAITRADE 3LB BAG USA', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'708', N'FAIR TRADE BAG 13 KLS', 0.72, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'709', N'BLANC BAG TURBANA SM', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'710', N'FLO FT 12 BAG 15 KLS', 0.83, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'711', N'FLO FT 12 BAG 15 KLS SM', 0.83, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'712', N'PRIMERA NORMAL DOLPHIN HD KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'713', N'SEGUNDA DARIEN ESTÁNDAR KILOS 20 -', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'714', N'PRIMERA NORMAL TURBANA PREMIUM KILOS 20 -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'716', N'PR FYFFE PEV-EURO-45', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'717', N'PRIMERA NORMAL TROPY DARIÉN KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'719', N'FLO FT 20BAG MORRISONS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'720', N'CLUSTER BAG TURBANA BAG 3LBS KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7200', N'DEL MONTE PB-EU DM-COVER PP', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'721', N'DEL MONTE PB EU DM-COVER BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7210', N'DEL MONTE PB-EU DM-COVER B.BULK PP', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7215', N'DEL MONTE PB-EU DM-COVER B.BULK BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'722', N'COSTCO TB-BAG 3 LBS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7220', N'DEL MONTE EUROBOX-EU EEPB6 B.BULK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7225', N'DEL MONTE EUROBOX-EU EEPB6', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'723', N'FAIRTRADE PINTED BAG 13KG', 0.72, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7230', N'DEL MONTE PB-UK DM-COVER BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7235', N'DEL MONTE PREMIUM EUROMINI', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'724', N'FLO FT 24BAG MORRISONS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7240', N'DEL MONTE PB-DM-COVER BVC B.BULK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7245', N'DEL MONTE PB-EU DM-COVER BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'725', N'CLUSTER BAG FYFFES 3 LBS BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'726', N'PRIMERA NORMAL DOLE PREMIO BANAVAC KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'727', N'TROPY PREMIO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7270', N'UTC PB-EU DM-COVER BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7275', N'UTC PB-EU DM-COVER PP', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'728', N'ELABORADO MERCADO NACIONAL LARGO UNIBAN', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7280', N'UTC PB-EU DM-COVER B.BULK PP', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7285', N'UTC EUROPEO GRANEL BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'729', N'ELABORADO DEDO SUELTO 25 KLS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'730', N'RECH 20 KLS MDO NAL', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7300', N'DEL MONTE PREMIUM ITALIANO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'731', N'RECH 13 KLS MDO NAL', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'732', N'PR DOLE MEDITERRANEO PALLET', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'733', N'PR DOLE MED. GRANEL', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'7330', N'UTC ITALIANO DM-COVER', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'734', N'TURBANA 4 LBS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'735', N'CLUSTER BAG 1B CLUSTER BAG KILOS 15', 0.84, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'736', N'ANITA SPOT COMACO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'737', N'PRIMERA NORMAL FYFFES EUROBOX KILOS 20 -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'738', N'PR PLOP BAG SM-48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'739', N'BUMPER PACK', 0.74, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'740', N'CLUSTER BAG DOLE EXTRA SF-95 BANAVAC KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'741', N'DOLE CABANITA BANAVAC KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'742', N'PR DON MARIO KILOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'743', N'CLUSTER BAG MORRISONS BUMPER PACK KILOS 13', 0.71, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'744', N'PRIMERA NORMAL PREMIUM LOBLAW KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'745', N'FT WHOLE FOODS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'746', N'PRIMERA NORMAL PREMIUM TROPY HD KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'747', N'MORRISON 16 MOR8', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'748', N'FLO FT 13 BAG 16.5 K', 0.91, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'749', N'PRIMERA NORMAL DOLE BAJELLA BANAVAC  KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'750', N'PR TROPICAL EDEN -48', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'767', N'FT 14 KLS- 75 DEDOS', 0.77, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'771', N'CLUSTER BAG 1B-ASDA GARDEN 15CB8 KILOS 15', 0.79, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'780', N'MI CASA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'781', N'BAHIA SPOT COMACO EUROPALLET 20K BANAV', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'783', N'PR TURBANA COLOMBIA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'794', N'FT 13 KLS 16CB7 BAG', 0.71, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'799', N'JS FAIR TRADE EU-50', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8100', N'5 A DAY USA', 1, 1)
GO
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'811', N'PREMIUM TURBANA NEW LOGO 48 KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8118', N'PRIMERA NORMAL DOLE EXTRA SF-95 POLYPACK KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8123', N'CLUSTER BAG DOLE BARE CLUSTER BAG KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8124', N'SEGUNDA NORMAL DOLE BAJELLA POLYPACK KILOS 20', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8125', N'PRIMERA NORMAL DOLE FIRST PRICE KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8127', N'PRIMERA NORMAL DOLE FIRST PRICE KILOS 21', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'8136', N'PRIMERA NORMAL DOLE CABANITA POLYPACK KILOS 20', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'817', N'DEDO SUELTO CORTO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'818', N'FT WHOLE FOODS -', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'820', N'PREMIUM UNIFRUIT KRAFT 20 KLOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'823', N'PRIMERA TROPY KRAFT', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'833', N'FLO FT 13 BAG 16.5 K -', 0.91, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'834', N'FT-WAITROSE 17', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'839', N'FAIRTRADE 3 LB BAG USA', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'840', N'PRIMERA B FYFFES 12.7 KL 60 13 KLS CLUSTERG', 0.72, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'844', N'FAIR TRADE 18 KL', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'845', N'FLO FT EUROPEA 18.14 KG - FTMH18', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'847', N'PR SUPREME MEDIT EUR', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'851', N'PRIMERA TROPY MEDITERRANEO PACIFIC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'853', N'FLO TROPY HD', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'862', N'DEL MONTE  FRANCIA PB EU DM-COVER BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'863', N'FLO FT EUROPA 18.14 KG - FT18', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'865', N'FT SMALL 13 KG', 0.71, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'868', N'SEGUNDA HAPPY BANANAS', 1, 2)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'877', N'FTJS FAIR T17K EU-50', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'878', N'FT 13 BAG 16.5 K', 0.91, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'880', N'DOLE PREMIUM', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'882', N'PRIMERA DOLE BAJELLA POLYPACK 20 KLOS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'883', N'PREMIO BAJELLA POLYPACK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'887', N'DEL MONTE  PORTUGAL PB EU DM-COVER BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'888', N'SELEC ORSERO BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'889', N'SELEC ORSERO BANANAS -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'891', N'FT PRIMERA WAITROSD 17 KILOS', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'897', N'FT EUROPA 18.14 KLOS FTNS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'906', N'PRIMERA ASDA 17 KLOS', 0.94, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9100', N'DM USA', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9110', N'ROSY', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9120', N'3 LBS BAG', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'913', N'PR AS17 NEW', 0.95, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9135', N'U.T.C', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'918', N'FT PRIMERA ST FIRE 3 LIBRAS BAG', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'919', N'FT PRIMERA WHOLE FOODS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9200', N'DM 27 BD PALLET POLYPACK', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9210', N'DM GRANEL', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9220', N'EUROBOX', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9225', N'DM EUBOX-EU-EEPB-6', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9230', N'DM PALLET', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9245', N'DM PALLET BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9260', N'ROSY PALLET BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9270', N'U.T.C PALLET BVC', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9275', N'U.T.C PALLET POLY P.', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9280', N'U.T.C GRANEL', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'930', N'PRIMERA TROPY HD KRAFT', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9300', N'DM ITALIANO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'9330', N'UTC MEDITERRANEO BVC PALLET', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'934', N'PR BAHIA HDSIN SELLO', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'935', N'PR SIMBA BANANAS', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'942', N'PRIMERA SLOBANA PREMIUM HD', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'945', N'PR FYFFES STD - HD', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'946', N'PR FYFFES MED 18.14', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'947', N'SELECT PEV FYFFES 18K', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'950', N'FT WALTROSE  17', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'956', N'PR CONAD', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'96', N'FRUTA PREMIUN BANANAS COREANO', 1, 3)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'960', N'FT 14 CB 6 EU-60 BAG', 0.78, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'967', N'FT FAIRTRADE FTFY18 20 KLOS', 1, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'97', N'FRUTA MERCADO NACIONAL ESPECIAL', 1, 3)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'970', N'PR SUPREME MEDIT EUR (BANAFRUT) ', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'972', N'FTJS FAIR T17K EU-50 -', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'975', N'PR SUPREME MEDIT EUR -', 1, 1)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'98', N'FRUTA PREMIUN FRUTICA', 1, 4)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'983', N'FT PRIMERA WAITROSD 17 KILOS -', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'985', N'FT DOCE KILOS', 0.66, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'99', N'FRUTA CATEGORIA II FRUTICA ', 1, 5)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'991', N'FT TEFTB 15 EU-50 17 KL BAG', 0.94, 6)
INSERT [dbo].[TblCajasProduccion] ([PKCodigo], [Descripcion], [FactorConversion], [FKId_TblTipoFruta]) VALUES (N'999', N'JS FAIR TRADE 17K E', 0.94, 1)
GO
SET IDENTITY_INSERT [dbo].[TblCargue] ON 

INSERT [dbo].[TblCargue] ([PKId_Cargue], [FKIbm_TblFincas], [Cliente], [Fecha_Cargue], [N_Poma], [DedoSuelto], [Cluster], [ManoEntera], [Especial], [Bolsa20Kilos], [Bolsa25Kilos], [Total], [Placa_Vehiculo], [Conductor], [FKCod_TblEmbarque]) VALUES (5, N'80004', N'Nombre cliente1', CAST(N'2020-11-29' AS Date), N'1542', 250, NULL, 0, 0, 0, 0, 250, N'ABC-123', N'No hay', N'EMB-20202')
SET IDENTITY_INSERT [dbo].[TblCargue] OFF
GO
SET IDENTITY_INSERT [dbo].[TblCintas] ON 

INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (1, N'CAFÉ')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (2, N'NEGRA')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (3, N'NARANJA')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (4, N'VERDE')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (5, N'AMARILLA')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (6, N'BLANCA')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (7, N'AZUL')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (8, N'GRIS')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (9, N'MORADA')
INSERT [dbo].[TblCintas] ([PKId], [Descripcion]) VALUES (10, N'ROJA')
SET IDENTITY_INSERT [dbo].[TblCintas] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDet_TblDet_TblProduccion] ON 

INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (106, 50, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (107, 51, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (108, 52, N'1015', 200)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (109, 53, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (110, 54, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (111, 55, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (112, 56, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (113, 57, N'1011', 100)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (114, 57, N'1014', 300)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (115, 57, N'1015', 500)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (116, 57, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (117, 58, N'1011', 200)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (118, 58, N'1014', 400)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (119, 58, N'1015', 150)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (120, 58, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (121, 59, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (122, 59, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (123, 59, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (124, 59, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (125, 60, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (126, 60, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (127, 60, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (128, 60, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (129, 61, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (130, 61, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (131, 61, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (132, 61, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (133, 62, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (134, 62, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (135, 62, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (136, 62, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (137, 63, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (138, 63, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (139, 63, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (140, 63, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (141, 64, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (142, 64, N'1014', 200)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (143, 64, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (144, 64, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (145, 65, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (146, 65, N'1014', 3000)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (147, 65, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (148, 65, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (149, 66, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (150, 66, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (151, 66, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (152, 66, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (153, 67, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (154, 67, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (155, 67, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (156, 67, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (157, 68, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (158, 68, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (159, 68, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (160, 68, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (161, 69, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (162, 69, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (163, 69, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (164, 69, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (165, 70, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (166, 70, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (167, 70, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (168, 70, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (204, 78, N'1011', 120)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (205, 78, N'1014', 199)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (206, 78, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (207, 78, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (208, 79, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (209, 79, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (210, 79, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (211, 79, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (212, 80, N'1011', 569)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (213, 80, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (214, 80, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (215, 80, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (216, 81, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (217, 81, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (218, 81, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (219, 81, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (220, 82, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (221, 82, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (222, 82, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (223, 82, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (224, 83, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (225, 83, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (226, 83, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (227, 83, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (228, 84, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (229, 84, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (230, 84, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (231, 84, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1071, 1036, N'1011', 500)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1072, 1036, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1073, 1036, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1074, 1037, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1075, 1037, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1076, 1037, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1077, 1038, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1078, 1038, N'1014', NULL)
GO
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1079, 1038, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1080, 1039, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1081, 1039, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1082, 1039, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1083, 1040, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1084, 1040, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1085, 1040, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1086, 1041, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1087, 1041, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1088, 1041, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1089, 1042, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1090, 1042, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (1091, 1042, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2015, 2015, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2016, 2015, N'1313', 2500)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2017, 2016, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2018, 2016, N'1313', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2019, 2017, N'1015', 200)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2020, 2017, N'1313', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2021, 2018, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2022, 2018, N'1313', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2023, 2019, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2024, 2019, N'1313', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2025, 2020, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2026, 2020, N'1313', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2027, 2021, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2028, 2021, N'1313', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2155, 2050, N'1017', 500)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2156, 2050, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2157, 2050, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2158, 2050, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2159, 2051, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2160, 2051, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2161, 2051, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2162, 2051, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2163, 2052, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2164, 2052, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2165, 2052, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2166, 2052, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2167, 2053, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2168, 2053, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2169, 2053, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2170, 2053, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2171, 2054, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2172, 2054, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2173, 2054, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2174, 2054, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2175, 2055, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2176, 2055, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2177, 2055, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2178, 2055, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2179, 2056, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2180, 2056, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2181, 2056, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2182, 2056, N'1361', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2239, 2071, N'1011', 3000)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2240, 2071, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2241, 2071, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2242, 2071, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2243, 2071, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2244, 2072, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2245, 2072, N'1014', 5455)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2246, 2072, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2247, 2072, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2248, 2072, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2249, 2073, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2250, 2073, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2251, 2073, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2252, 2073, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2253, 2073, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2254, 2074, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2255, 2074, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2256, 2074, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2257, 2074, N'1036', 500)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2258, 2074, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2259, 2075, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2260, 2075, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2261, 2075, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2262, 2075, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2263, 2075, N'1114', 10000)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2264, 2076, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2265, 2076, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2266, 2076, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2267, 2076, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2268, 2076, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2269, 2077, N'1011', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2270, 2077, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2271, 2077, N'1015', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2272, 2077, N'1036', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (2273, 2077, N'1114', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6233, 5092, N'1017', 756)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6234, 5092, N'1081', 25)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6235, 5092, N'1271', 54)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6236, 5092, N'1339', 19)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6237, 5092, N'1396', 17)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6239, 5093, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6240, 5093, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6241, 5093, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6242, 5093, N'1339', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6243, 5093, N'1396', NULL)
GO
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6245, 5094, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6246, 5094, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6247, 5094, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6248, 5094, N'1339', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6249, 5094, N'1396', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6251, 5095, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6252, 5095, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6253, 5095, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6254, 5095, N'1339', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6255, 5095, N'1396', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6257, 5096, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6258, 5096, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6259, 5096, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6260, 5096, N'1339', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6261, 5096, N'1396', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6263, 5097, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6264, 5097, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6265, 5097, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6266, 5097, N'1339', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6267, 5097, N'1396', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6269, 5098, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6270, 5098, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6271, 5098, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6272, 5098, N'1339', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6273, 5098, N'1396', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6632, 5120, N'1014', 270)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6633, 5120, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6634, 5120, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6635, 5120, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6636, 5120, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6637, 5120, N'1239', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6638, 5120, N'1242', 53)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6639, 5120, N'1271', 108)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6640, 5120, N'1298', 605)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6641, 5120, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6642, 5120, N'1368', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6643, 5120, N'1425', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6644, 5120, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6645, 5120, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6646, 5120, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6647, 5120, N'919', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6649, 5121, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6650, 5121, N'1017', 972)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6651, 5121, N'1081', 14)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6652, 5121, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6653, 5121, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6654, 5121, N'1239', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6655, 5121, N'1242', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6656, 5121, N'1271', 378)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6657, 5121, N'1298', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6658, 5121, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6659, 5121, N'1368', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6660, 5121, N'1425', 110)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6661, 5121, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6662, 5121, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6663, 5121, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6664, 5121, N'919', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6666, 5122, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6667, 5122, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6668, 5122, N'1081', 23)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6669, 5122, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6670, 5122, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6671, 5122, N'1239', 40)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6672, 5122, N'1242', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6673, 5122, N'1271', 54)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6674, 5122, N'1298', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6675, 5122, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6676, 5122, N'1368', 33)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6677, 5122, N'1425', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6678, 5122, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6679, 5122, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6680, 5122, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6681, 5122, N'919', 912)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6683, 5123, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6684, 5123, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6685, 5123, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6686, 5123, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6687, 5123, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6688, 5123, N'1239', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6689, 5123, N'1242', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6690, 5123, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6691, 5123, N'1298', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6692, 5123, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6693, 5123, N'1368', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6694, 5123, N'1425', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6695, 5123, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6696, 5123, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6697, 5123, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6698, 5123, N'919', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6700, 5124, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6701, 5124, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6702, 5124, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6703, 5124, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6704, 5124, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6705, 5124, N'1239', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6706, 5124, N'1242', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6707, 5124, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6708, 5124, N'1298', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6709, 5124, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6710, 5124, N'1368', NULL)
GO
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6711, 5124, N'1425', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6712, 5124, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6713, 5124, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6714, 5124, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6715, 5124, N'919', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6717, 5125, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6718, 5125, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6719, 5125, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6720, 5125, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6721, 5125, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6722, 5125, N'1239', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6723, 5125, N'1242', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6724, 5125, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6725, 5125, N'1298', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6726, 5125, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6727, 5125, N'1368', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6728, 5125, N'1425', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6729, 5125, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6730, 5125, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6731, 5125, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6732, 5125, N'919', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6734, 5126, N'1014', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6735, 5126, N'1017', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6736, 5126, N'1081', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6737, 5126, N'1126', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6738, 5126, N'1231', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6739, 5126, N'1239', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6740, 5126, N'1242', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6741, 5126, N'1271', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6742, 5126, N'1298', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6743, 5126, N'1341', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6744, 5126, N'1368', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6745, 5126, N'1425', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6746, 5126, N'1436', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6747, 5126, N'1460', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6748, 5126, N'609', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (6749, 5126, N'919', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7015, 6015, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7017, 6016, N'1010', 40)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7019, 6017, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7021, 6018, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7023, 6019, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7025, 6020, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7027, 6021, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7085, 6050, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7087, 6051, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7089, 6052, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7091, 6053, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7093, 6054, N'1010', 88)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7095, 6055, N'1010', NULL)
INSERT [dbo].[TblDet_TblDet_TblProduccion] ([PKId], [FKId_TblDet_TblProduccion], [FKCodigo_TblCajasProduccion], [N_CajasProducidas_Dia]) VALUES (7097, 6056, N'1010', NULL)
SET IDENTITY_INSERT [dbo].[TblDet_TblDet_TblProduccion] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ON 

INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (197, 50, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (198, 50, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (199, 50, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (200, 50, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (201, 51, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (203, 51, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (205, 52, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (206, 52, 2, 586)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (207, 52, 3, 52)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (208, 52, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (209, 53, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (210, 53, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (211, 53, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (212, 53, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (213, 54, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (214, 54, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (215, 54, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (216, 54, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (217, 55, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (218, 55, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (219, 55, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (220, 55, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (221, 56, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (222, 56, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (223, 56, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (224, 56, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (225, 57, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (226, 57, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (227, 57, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (228, 57, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (229, 58, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (230, 58, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (231, 58, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (232, 58, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (233, 59, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (234, 59, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (235, 59, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (236, 59, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (237, 60, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (238, 60, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (239, 60, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (240, 60, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (241, 61, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (242, 61, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (243, 61, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (244, 61, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (245, 62, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (246, 62, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (247, 62, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (248, 62, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (249, 63, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (250, 63, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (251, 63, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (252, 63, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (253, 64, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (254, 64, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (255, 64, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (256, 64, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (257, 65, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (258, 65, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (259, 65, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (260, 65, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (261, 66, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (262, 66, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (263, 66, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (264, 66, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (265, 67, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (266, 67, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (267, 67, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (268, 67, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (269, 68, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (270, 68, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (271, 68, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (272, 68, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (273, 69, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (274, 69, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (275, 69, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (276, 69, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (277, 70, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (278, 70, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (279, 70, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (280, 70, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (309, 78, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (310, 78, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (311, 78, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (312, 78, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (313, 79, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (314, 79, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (315, 79, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (316, 79, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (317, 80, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (318, 80, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (319, 80, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (320, 80, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (321, 81, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (322, 81, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (323, 81, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (324, 81, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (325, 82, 2, 0)
GO
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (326, 82, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (327, 82, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (328, 82, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (329, 83, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (330, 83, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (331, 83, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (332, 83, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (333, 84, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (334, 84, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (335, 84, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (336, 84, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1141, 1036, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1142, 1036, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1143, 1036, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1144, 1036, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1145, 1037, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1146, 1037, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1147, 1037, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1148, 1037, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1149, 1038, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1150, 1038, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1151, 1038, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1152, 1038, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1153, 1039, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1154, 1039, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1155, 1039, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1156, 1039, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1157, 1040, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1158, 1040, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1159, 1040, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1160, 1040, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1161, 1041, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1162, 1041, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1163, 1041, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1164, 1041, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1165, 1042, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1166, 1042, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1167, 1042, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1168, 1042, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1421, 1106, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1422, 1106, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1423, 1106, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1424, 1106, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1425, 1107, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1426, 1107, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1427, 1107, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1428, 1107, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1429, 1108, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1430, 1108, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1431, 1108, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1432, 1108, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1433, 1109, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1434, 1109, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1435, 1109, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1436, 1109, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1437, 1110, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1438, 1110, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1439, 1110, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1440, 1110, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1441, 1111, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1442, 1111, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1443, 1111, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1444, 1111, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1445, 1112, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1446, 1112, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1447, 1112, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (1448, 1112, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2057, 2015, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2058, 2015, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2059, 2015, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2060, 2015, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2061, 2016, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2062, 2016, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2063, 2016, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2064, 2016, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2065, 2017, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2066, 2017, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2067, 2017, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2068, 2017, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2069, 2018, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2070, 2018, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2071, 2018, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2072, 2018, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2073, 2019, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2074, 2019, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2075, 2019, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2076, 2019, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2077, 2020, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2078, 2020, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2079, 2020, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2080, 2020, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2081, 2021, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2082, 2021, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2083, 2021, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2084, 2021, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2197, 2050, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2198, 2050, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2199, 2050, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2200, 2050, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2201, 2051, 9, 0)
GO
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2202, 2051, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2203, 2051, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2204, 2051, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2205, 2052, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2206, 2052, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2207, 2052, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2208, 2052, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2209, 2053, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2210, 2053, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2211, 2053, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2212, 2053, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2213, 2054, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2214, 2054, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2215, 2054, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2216, 2054, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2217, 2055, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2218, 2055, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2219, 2055, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2220, 2055, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2221, 2056, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2222, 2056, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2223, 2056, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2224, 2056, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2281, 2071, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2282, 2071, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2283, 2071, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2284, 2071, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2285, 2072, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2286, 2072, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2287, 2072, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2288, 2072, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2289, 2073, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2290, 2073, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2291, 2073, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2292, 2073, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2293, 2074, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2294, 2074, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2295, 2074, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2296, 2074, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2297, 2075, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2298, 2075, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2299, 2075, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2300, 2075, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2301, 2076, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2302, 2076, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2303, 2076, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2304, 2076, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2305, 2077, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2306, 2077, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2307, 2077, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (2308, 2077, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5365, 5092, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5366, 5092, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5367, 5092, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5368, 5092, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5369, 5093, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5370, 5093, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5371, 5093, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5372, 5093, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5373, 5094, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5374, 5094, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5375, 5094, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5376, 5094, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5377, 5095, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5378, 5095, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5379, 5095, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5380, 5095, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5381, 5096, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5382, 5096, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5383, 5096, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5384, 5096, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5385, 5097, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5386, 5097, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5387, 5097, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5388, 5097, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5389, 5098, 9, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5390, 5098, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5391, 5098, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5392, 5098, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5477, 5120, 10, 54)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5478, 5120, 1, 537)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5479, 5120, 2, 260)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5480, 5120, 3, 45)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5481, 5121, 10, 7)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5482, 5121, 1, 883)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5483, 5121, 2, 556)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5484, 5121, 3, 45)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5485, 5122, 10, 87)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5486, 5122, 1, 623)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5487, 5122, 2, 325)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5488, 5122, 3, 43)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5489, 5123, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5490, 5123, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5491, 5123, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5492, 5123, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5493, 5124, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5494, 5124, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5495, 5124, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5496, 5124, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5497, 5125, 10, 0)
GO
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5498, 5125, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5499, 5125, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5500, 5125, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5501, 5126, 10, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5502, 5126, 1, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5503, 5126, 2, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (5504, 5126, 3, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6057, 6015, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6058, 6015, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6059, 6015, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6060, 6015, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6061, 6016, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6062, 6016, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6063, 6016, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6064, 6016, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6065, 6017, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6066, 6017, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6067, 6017, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6068, 6017, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6069, 6018, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6070, 6018, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6071, 6018, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6072, 6018, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6073, 6019, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6074, 6019, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6075, 6019, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6076, 6019, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6077, 6020, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6078, 6020, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6079, 6020, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6080, 6020, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6081, 6021, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6082, 6021, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6083, 6021, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6084, 6021, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6197, 6050, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6198, 6050, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6199, 6050, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6200, 6050, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6201, 6051, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6202, 6051, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6203, 6051, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6204, 6051, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6205, 6052, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6206, 6052, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6207, 6052, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6208, 6052, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6209, 6053, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6210, 6053, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6211, 6053, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6212, 6053, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6213, 6054, 4, 1)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6214, 6054, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6215, 6054, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6216, 6054, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6217, 6055, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6218, 6055, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6219, 6055, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6220, 6055, 7, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6221, 6056, 4, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6222, 6056, 5, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6223, 6056, 6, 0)
INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblDet_TblRacimos_TblDias], [FKId_TblCintas], [N_RacimosC_Cintas]) VALUES (6224, 6056, 7, 0)
SET IDENTITY_INSERT [dbo].[TblDet_TblDet_TblRacimos_TblDias] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDet_TblEmbarque] ON 

INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (47, N'EMB-20201', N'80009', N'1015', 200)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (48, N'EMB-20201', N'85747', N'1015', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (49, N'EMB-20201', N'80004', N'1015', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (50, N'EMB-20201', N'80075', N'1015', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (51, N'EMB-20201', N'80074', N'1015', 900)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (52, N'EMB-20201', N'80008', N'1015', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (53, N'EMB-20201', N'80009', N'1054', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (54, N'EMB-20201', N'85747', N'1054', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (55, N'EMB-20201', N'80004', N'1054', 300)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (56, N'EMB-20201', N'80075', N'1054', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (57, N'EMB-20201', N'80074', N'1054', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (58, N'EMB-20201', N'80008', N'1054', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (59, N'EMB-20201', N'80009', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (60, N'EMB-20201', N'85747', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (61, N'EMB-20201', N'80004', N'1313', 100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (62, N'EMB-20201', N'80075', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (63, N'EMB-20201', N'80074', N'1313', 5000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (64, N'EMB-20201', N'80008', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (65, N'EMB-20202', N'80009', N'1011', 1200)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (66, N'EMB-20202', N'85747', N'1011', 3000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (67, N'EMB-20202', N'80004', N'1011', 2000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (68, N'EMB-20202', N'80075', N'1011', 2500)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (69, N'EMB-20202', N'80074', N'1011', 3600)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (70, N'EMB-20202', N'80008', N'1011', 1520)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (71, N'EMB-20202', N'80009', N'1014', 1528)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (72, N'EMB-20202', N'85747', N'1014', 5456)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (73, N'EMB-20202', N'80004', N'1014', 6000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (74, N'EMB-20202', N'80075', N'1014', 2000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (75, N'EMB-20202', N'80074', N'1014', 1000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (76, N'EMB-20202', N'80008', N'1014', 2000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (77, N'EMB-20202', N'80009', N'1015', 3000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (78, N'EMB-20202', N'85747', N'1015', 4000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (79, N'EMB-20202', N'80004', N'1015', 5000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (80, N'EMB-20202', N'80075', N'1015', 4000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (81, N'EMB-20202', N'80074', N'1015', 3000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (82, N'EMB-20202', N'80008', N'1015', 600)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (83, N'EMB-20202', N'80009', N'1036', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (84, N'EMB-20202', N'85747', N'1036', 500)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (85, N'EMB-20202', N'80004', N'1036', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (86, N'EMB-20202', N'80075', N'1036', 780)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (87, N'EMB-20202', N'80074', N'1036', 7569)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (88, N'EMB-20202', N'80008', N'1036', 1000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (89, N'EMB-20202', N'80009', N'1114', 4100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (90, N'EMB-20202', N'85747', N'1114', 10000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (91, N'EMB-20202', N'80004', N'1114', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (92, N'EMB-20202', N'80075', N'1114', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (93, N'EMB-20202', N'80074', N'1114', 1500)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (94, N'EMB-20202', N'80008', N'1114', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (95, N'EMB-20202', N'80009', N'1154', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (96, N'EMB-20202', N'85747', N'1154', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (97, N'EMB-20202', N'80004', N'1154', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (98, N'EMB-20202', N'80075', N'1154', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (99, N'EMB-20202', N'80074', N'1154', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (100, N'EMB-20202', N'80008', N'1154', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (1119, N'EMB-20201', N'80009', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (1120, N'EMB-20201', N'85747', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (1121, N'EMB-20201', N'80004', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (1122, N'EMB-20201', N'80075', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (1123, N'EMB-20201', N'80074', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (1124, N'EMB-20201', N'80008', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2065, N'EMB-202049', N'80009', N'1017', 756)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2066, N'EMB-202049', N'85747', N'1017', 756)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2067, N'EMB-202049', N'80004', N'1017', 0)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2068, N'EMB-202049', N'80075', N'1017', 540)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2069, N'EMB-202049', N'80074', N'1017', 756)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2070, N'EMB-202049', N'80008', N'1017', 270)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2071, N'EMB-202049', N'80009', N'1081', 25)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2072, N'EMB-202049', N'85747', N'1081', 50)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2073, N'EMB-202049', N'80004', N'1081', 50)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2074, N'EMB-202049', N'80075', N'1081', 40)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2075, N'EMB-202049', N'80074', N'1081', 25)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2076, N'EMB-202049', N'80008', N'1081', 60)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2077, N'EMB-202049', N'80009', N'1271', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2078, N'EMB-202049', N'85747', N'1271', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2079, N'EMB-202049', N'80004', N'1271', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2080, N'EMB-202049', N'80075', N'1271', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2081, N'EMB-202049', N'80074', N'1271', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2082, N'EMB-202049', N'80008', N'1271', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2083, N'EMB-202049', N'80009', N'1298', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2084, N'EMB-202049', N'85747', N'1298', 30)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2085, N'EMB-202049', N'80004', N'1298', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2086, N'EMB-202049', N'80075', N'1298', 135)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2087, N'EMB-202049', N'80074', N'1298', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2088, N'EMB-202049', N'80008', N'1298', 220)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2089, N'EMB-202049', N'80009', N'1339', 19)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2090, N'EMB-202049', N'85747', N'1339', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2091, N'EMB-202049', N'80004', N'1339', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2092, N'EMB-202049', N'80075', N'1339', 19)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2093, N'EMB-202049', N'80074', N'1339', 19)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2094, N'EMB-202049', N'80008', N'1339', 19)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2095, N'EMB-202049', N'80009', N'1361', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2096, N'EMB-202049', N'85747', N'1361', 22)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2097, N'EMB-202049', N'80004', N'1361', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2098, N'EMB-202049', N'80075', N'1361', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2099, N'EMB-202049', N'80074', N'1361', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2100, N'EMB-202049', N'80008', N'1361', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2101, N'EMB-202049', N'80009', N'1396', 22)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2102, N'EMB-202049', N'85747', N'1396', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2103, N'EMB-202049', N'80004', N'1396', 22)
GO
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2104, N'EMB-202049', N'80075', N'1396', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2105, N'EMB-202049', N'80074', N'1396', 17)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2106, N'EMB-202049', N'80008', N'1396', 30)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2107, N'EMB-202049', N'80009', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2108, N'EMB-202049', N'85747', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2109, N'EMB-202049', N'80004', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2110, N'EMB-202049', N'80075', N'1425', 55)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2111, N'EMB-202049', N'80074', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2112, N'EMB-202049', N'80008', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2113, N'EMB-202049', N'80009', N'1313', 100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2114, N'EMB-202049', N'85747', N'1313', 200)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2115, N'EMB-202049', N'80004', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2116, N'EMB-202049', N'80075', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2117, N'EMB-202049', N'80074', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (2118, N'EMB-202049', N'80008', N'1313', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3203, N'EMB-202050', N'80009', N'1014', 378)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3204, N'EMB-202050', N'85747', N'1014', 378)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3205, N'EMB-202050', N'80004', N'1014', 162)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3206, N'EMB-202050', N'80075', N'1014', 216)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3207, N'EMB-202050', N'80074', N'1014', 270)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3208, N'EMB-202050', N'80008', N'1014', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3209, N'EMB-202050', N'80009', N'1017', 864)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3210, N'EMB-202050', N'85747', N'1017', 864)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3211, N'EMB-202050', N'80004', N'1017', 702)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3212, N'EMB-202050', N'80075', N'1017', 918)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3213, N'EMB-202050', N'80074', N'1017', 972)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3214, N'EMB-202050', N'80008', N'1017', 864)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3215, N'EMB-202050', N'80009', N'1081', 20)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3216, N'EMB-202050', N'85747', N'1081', 30)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3217, N'EMB-202050', N'80004', N'1081', 30)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3218, N'EMB-202050', N'80075', N'1081', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3219, N'EMB-202050', N'80074', N'1081', 40)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3220, N'EMB-202050', N'80008', N'1081', 30)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3221, N'EMB-202050', N'80009', N'1126', 192)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3222, N'EMB-202050', N'85747', N'1126', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3223, N'EMB-202050', N'80004', N'1126', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3224, N'EMB-202050', N'80075', N'1126', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3225, N'EMB-202050', N'80074', N'1126', 768)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3226, N'EMB-202050', N'80008', N'1126', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3227, N'EMB-202050', N'80009', N'1196', 100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3228, N'EMB-202050', N'85747', N'1196', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3229, N'EMB-202050', N'80004', N'1196', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3230, N'EMB-202050', N'80075', N'1196', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3231, N'EMB-202050', N'80074', N'1196', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3232, N'EMB-202050', N'80008', N'1196', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3233, N'EMB-202050', N'80009', N'1231', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3234, N'EMB-202050', N'85747', N'1231', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3235, N'EMB-202050', N'80004', N'1231', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3236, N'EMB-202050', N'80075', N'1231', 48)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3237, N'EMB-202050', N'80074', N'1231', 48)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3238, N'EMB-202050', N'80008', N'1231', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3239, N'EMB-202050', N'80009', N'1239', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3240, N'EMB-202050', N'85747', N'1239', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3241, N'EMB-202050', N'80004', N'1239', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3242, N'EMB-202050', N'80075', N'1239', 40)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3243, N'EMB-202050', N'80074', N'1239', 40)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3244, N'EMB-202050', N'80008', N'1239', 48)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3245, N'EMB-202050', N'80009', N'1242', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3246, N'EMB-202050', N'85747', N'1242', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3247, N'EMB-202050', N'80004', N'1242', 20)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3248, N'EMB-202050', N'80075', N'1242', 53)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3249, N'EMB-202050', N'80074', N'1242', 53)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3250, N'EMB-202050', N'80008', N'1242', 59)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3251, N'EMB-202050', N'80009', N'1271', 432)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3252, N'EMB-202050', N'85747', N'1271', 432)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3253, N'EMB-202050', N'80004', N'1271', 324)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3254, N'EMB-202050', N'80075', N'1271', 324)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3255, N'EMB-202050', N'80074', N'1271', 540)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3256, N'EMB-202050', N'80008', N'1271', 432)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3257, N'EMB-202050', N'80009', N'1298', 550)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3258, N'EMB-202050', N'85747', N'1298', 550)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3259, N'EMB-202050', N'80004', N'1298', 550)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3260, N'EMB-202050', N'80075', N'1298', 550)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3261, N'EMB-202050', N'80074', N'1298', 605)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3262, N'EMB-202050', N'80008', N'1298', 605)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3263, N'EMB-202050', N'80009', N'1337', 25)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3264, N'EMB-202050', N'85747', N'1337', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3265, N'EMB-202050', N'80004', N'1337', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3266, N'EMB-202050', N'80075', N'1337', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3267, N'EMB-202050', N'80074', N'1337', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3268, N'EMB-202050', N'80008', N'1337', 25)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3269, N'EMB-202050', N'80009', N'1341', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3270, N'EMB-202050', N'85747', N'1341', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3271, N'EMB-202050', N'80004', N'1341', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3272, N'EMB-202050', N'80075', N'1341', 35)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3273, N'EMB-202050', N'80074', N'1341', 35)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3274, N'EMB-202050', N'80008', N'1341', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3275, N'EMB-202050', N'80009', N'1349', 100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3276, N'EMB-202050', N'85747', N'1349', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3277, N'EMB-202050', N'80004', N'1349', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3278, N'EMB-202050', N'80075', N'1349', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3279, N'EMB-202050', N'80074', N'1349', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3280, N'EMB-202050', N'80008', N'1349', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3281, N'EMB-202050', N'80009', N'1354', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3282, N'EMB-202050', N'85747', N'1354', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3283, N'EMB-202050', N'80004', N'1354', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3284, N'EMB-202050', N'80075', N'1354', 55)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3285, N'EMB-202050', N'80074', N'1354', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3286, N'EMB-202050', N'80008', N'1354', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3287, N'EMB-202050', N'80009', N'1368', NULL)
GO
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3288, N'EMB-202050', N'85747', N'1368', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3289, N'EMB-202050', N'80004', N'1368', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3290, N'EMB-202050', N'80075', N'1368', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3291, N'EMB-202050', N'80074', N'1368', 33)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3292, N'EMB-202050', N'80008', N'1368', 30)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3293, N'EMB-202050', N'80009', N'1377', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3294, N'EMB-202050', N'85747', N'1377', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3295, N'EMB-202050', N'80004', N'1377', 54)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3296, N'EMB-202050', N'80075', N'1377', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3297, N'EMB-202050', N'80074', N'1377', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3298, N'EMB-202050', N'80008', N'1377', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3299, N'EMB-202050', N'80009', N'1396', 40)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3300, N'EMB-202050', N'85747', N'1396', 40)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3301, N'EMB-202050', N'80004', N'1396', 43)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3302, N'EMB-202050', N'80075', N'1396', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3303, N'EMB-202050', N'80074', N'1396', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3304, N'EMB-202050', N'80008', N'1396', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3305, N'EMB-202050', N'80009', N'1425', 110)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3306, N'EMB-202050', N'85747', N'1425', 110)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3307, N'EMB-202050', N'80004', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3308, N'EMB-202050', N'80075', N'1425', 110)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3309, N'EMB-202050', N'80074', N'1425', 110)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3310, N'EMB-202050', N'80008', N'1425', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3311, N'EMB-202050', N'80009', N'1436', 210)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3312, N'EMB-202050', N'85747', N'1436', 210)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3313, N'EMB-202050', N'80004', N'1436', 210)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3314, N'EMB-202050', N'80075', N'1436', 210)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3315, N'EMB-202050', N'80074', N'1436', 140)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3316, N'EMB-202050', N'80008', N'1436', 210)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3317, N'EMB-202050', N'80009', N'1460', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3318, N'EMB-202050', N'85747', N'1460', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3319, N'EMB-202050', N'80004', N'1460', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3320, N'EMB-202050', N'80075', N'1460', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3321, N'EMB-202050', N'80074', N'1460', 70)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3322, N'EMB-202050', N'80008', N'1460', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3323, N'EMB-202050', N'80009', N'1461', 720)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3324, N'EMB-202050', N'85747', N'1461', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3325, N'EMB-202050', N'80004', N'1461', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3326, N'EMB-202050', N'80075', N'1461', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3327, N'EMB-202050', N'80074', N'1461', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3328, N'EMB-202050', N'80008', N'1461', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3329, N'EMB-202050', N'80009', N'609', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3330, N'EMB-202050', N'85747', N'609', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3331, N'EMB-202050', N'80004', N'609', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3332, N'EMB-202050', N'80075', N'609', 144)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3333, N'EMB-202050', N'80074', N'609', 192)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3334, N'EMB-202050', N'80008', N'609', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3335, N'EMB-202050', N'80009', N'919', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3336, N'EMB-202050', N'85747', N'919', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3337, N'EMB-202050', N'80004', N'919', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3338, N'EMB-202050', N'80075', N'919', 1248)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3339, N'EMB-202050', N'80074', N'919', 1392)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3340, N'EMB-202050', N'80008', N'919', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3353, N'EMB-20211', N'80009', N'1010', 900)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3354, N'EMB-20211', N'85747', N'1010', 1000)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3355, N'EMB-20211', N'80004', N'1010', 100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3356, N'EMB-20211', N'80075', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3357, N'EMB-20211', N'80074', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (3358, N'EMB-20211', N'80008', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4341, N'EMB-202111', N'80009', N'1010', 100)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4342, N'EMB-202111', N'85747', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4343, N'EMB-202111', N'80004', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4344, N'EMB-202111', N'80075', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4345, N'EMB-202111', N'80074', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4346, N'EMB-202111', N'80008', N'1010', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4347, N'EMB-202111', N'80009', N'1011', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4348, N'EMB-202111', N'85747', N'1011', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4349, N'EMB-202111', N'80004', N'1011', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4350, N'EMB-202111', N'80075', N'1011', 500)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4351, N'EMB-202111', N'80074', N'1011', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4352, N'EMB-202111', N'80008', N'1011', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4353, N'EMB-202111', N'80009', N'1014', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4354, N'EMB-202111', N'85747', N'1014', 200)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4355, N'EMB-202111', N'80004', N'1014', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4356, N'EMB-202111', N'80075', N'1014', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4357, N'EMB-202111', N'80074', N'1014', NULL)
INSERT [dbo].[TblDet_TblEmbarque] ([PKId], [FKCod_TblEmbarque], [FKIbm_TblFincas], [FKCodigo_TblCajasProduccion], [Cantidad]) VALUES (4358, N'EMB-202111', N'80008', N'1014', NULL)
SET IDENTITY_INSERT [dbo].[TblDet_TblEmbarque] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDet_TblMercadoNacional] ON 

INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (295, 8, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (296, 8, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (297, 8, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (298, 8, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (299, 8, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (300, 8, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (301, 8, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (302, 8, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (303, 8, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (304, 8, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (305, 8, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (306, 8, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (307, 8, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (308, 8, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (309, 8, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (310, 8, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (311, 8, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (312, 8, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (313, 8, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (314, 8, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (315, 8, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (316, 8, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (317, 8, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (318, 8, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (319, 8, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (320, 8, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (321, 8, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (322, 8, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (323, 8, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (324, 8, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (325, 8, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (326, 8, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (327, 8, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (328, 8, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (329, 8, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (330, 8, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (331, 8, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (332, 8, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (333, 8, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (334, 8, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (335, 8, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (336, 8, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (337, 9, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (338, 9, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (339, 9, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (340, 9, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (341, 9, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (342, 9, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (343, 9, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (344, 9, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (345, 9, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (346, 9, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (347, 9, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (348, 9, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (349, 9, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (350, 9, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (351, 9, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (352, 9, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (353, 9, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (354, 9, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (355, 9, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (356, 9, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (357, 9, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (358, 9, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (359, 9, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (360, 9, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (361, 9, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (362, 9, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (363, 9, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (364, 9, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (365, 9, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (366, 9, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (367, 9, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (368, 9, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (369, 9, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (370, 9, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (371, 9, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (372, 9, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (373, 9, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (374, 9, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (375, 9, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (376, 9, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (377, 9, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (378, 9, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (379, 10, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (380, 10, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (381, 10, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (382, 10, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (383, 10, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (384, 10, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (385, 10, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (386, 10, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (387, 10, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (388, 10, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (389, 10, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (390, 10, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (391, 10, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (392, 10, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (393, 10, 3, 3, 0)
GO
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (394, 10, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (395, 10, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (396, 10, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (397, 10, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (398, 10, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (399, 10, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (400, 10, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (401, 10, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (402, 10, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (403, 10, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (404, 10, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (405, 10, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (406, 10, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (407, 10, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (408, 10, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (409, 10, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (410, 10, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (411, 10, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (412, 10, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (413, 10, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (414, 10, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (415, 10, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (416, 10, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (417, 10, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (418, 10, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (419, 10, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (420, 10, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (463, 12, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (464, 12, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (465, 12, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (466, 12, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (467, 12, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (468, 12, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (469, 12, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (470, 12, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (471, 12, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (472, 12, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (473, 12, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (474, 12, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (475, 12, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (476, 12, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (477, 12, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (478, 12, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (479, 12, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (480, 12, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (481, 12, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (482, 12, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (483, 12, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (484, 12, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (485, 12, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (486, 12, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (487, 12, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (488, 12, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (489, 12, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (490, 12, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (491, 12, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (492, 12, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (493, 12, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (494, 12, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (495, 12, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (496, 12, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (497, 12, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (498, 12, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (499, 12, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (500, 12, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (501, 12, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (502, 12, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (503, 12, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (504, 12, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1211, 1006, 1, 1, 1000)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1212, 1006, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1213, 1006, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1214, 1006, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1215, 1006, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1216, 1006, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1217, 1006, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1218, 1006, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1219, 1006, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1220, 1006, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1221, 1006, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1222, 1006, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1223, 1006, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1224, 1006, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1225, 1006, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1226, 1006, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1227, 1006, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1228, 1006, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1229, 1006, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1230, 1006, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1231, 1006, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1232, 1006, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1233, 1006, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1234, 1006, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1235, 1006, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1236, 1006, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1237, 1006, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1238, 1006, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1239, 1006, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1240, 1006, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1241, 1006, 6, 1, 0)
GO
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1242, 1006, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1243, 1006, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1244, 1006, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1245, 1006, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1246, 1006, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1247, 1006, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1248, 1006, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1249, 1006, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1250, 1006, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1251, 1006, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1252, 1006, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1631, 1016, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1632, 1016, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1633, 1016, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1634, 1016, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1635, 1016, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1636, 1016, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1637, 1016, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1638, 1016, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1639, 1016, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1640, 1016, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1641, 1016, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1642, 1016, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1643, 1016, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1644, 1016, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1645, 1016, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1646, 1016, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1647, 1016, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1648, 1016, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1649, 1016, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1650, 1016, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1651, 1016, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1652, 1016, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1653, 1016, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1654, 1016, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1655, 1016, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1656, 1016, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1657, 1016, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1658, 1016, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1659, 1016, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1660, 1016, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1661, 1016, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1662, 1016, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1663, 1016, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1664, 1016, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1665, 1016, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1666, 1016, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1667, 1016, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1668, 1016, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1669, 1016, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1670, 1016, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1671, 1016, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (1672, 1016, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2085, 2003, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2086, 2003, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2087, 2003, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2088, 2003, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2089, 2003, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2090, 2003, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2091, 2003, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2092, 2003, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2093, 2003, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2094, 2003, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2095, 2003, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2096, 2003, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2097, 2003, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2098, 2003, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2099, 2003, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2100, 2003, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2101, 2003, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2102, 2003, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2103, 2003, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2104, 2003, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2105, 2003, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2106, 2003, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2107, 2003, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2108, 2003, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2109, 2003, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2110, 2003, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2111, 2003, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2112, 2003, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2113, 2003, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2114, 2003, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2115, 2003, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2116, 2003, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2117, 2003, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2118, 2003, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2119, 2003, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2120, 2003, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2121, 2003, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2122, 2003, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2123, 2003, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2124, 2003, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2125, 2003, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2126, 2003, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2295, 2008, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2296, 2008, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2297, 2008, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2298, 2008, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2299, 2008, 1, 5, 0)
GO
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2300, 2008, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2301, 2008, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2302, 2008, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2303, 2008, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2304, 2008, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2305, 2008, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2306, 2008, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2307, 2008, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2308, 2008, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2309, 2008, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2310, 2008, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2311, 2008, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2312, 2008, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2313, 2008, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2314, 2008, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2315, 2008, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2316, 2008, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2317, 2008, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2318, 2008, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2319, 2008, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2320, 2008, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2321, 2008, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2322, 2008, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2323, 2008, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2324, 2008, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2325, 2008, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2326, 2008, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2327, 2008, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2328, 2008, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2329, 2008, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2330, 2008, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2331, 2008, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2332, 2008, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2333, 2008, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2334, 2008, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2335, 2008, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2336, 2008, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2421, 2011, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2422, 2011, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2423, 2011, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2424, 2011, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2425, 2011, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2426, 2011, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2427, 2011, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2428, 2011, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2429, 2011, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2430, 2011, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2431, 2011, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2432, 2011, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2433, 2011, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2434, 2011, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2435, 2011, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2436, 2011, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2437, 2011, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2438, 2011, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2439, 2011, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2440, 2011, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2441, 2011, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2442, 2011, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2443, 2011, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2444, 2011, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2445, 2011, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2446, 2011, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2447, 2011, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2448, 2011, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2449, 2011, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2450, 2011, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2451, 2011, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2452, 2011, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2453, 2011, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2454, 2011, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2455, 2011, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2456, 2011, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2457, 2011, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2458, 2011, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2459, 2011, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2460, 2011, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2461, 2011, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (2462, 2011, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5547, 5014, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5548, 5014, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5549, 5014, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5550, 5014, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5551, 5014, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5552, 5014, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5553, 5014, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5554, 5014, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5555, 5014, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5556, 5014, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5557, 5014, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5558, 5014, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5559, 5014, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5560, 5014, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5561, 5014, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5562, 5014, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5563, 5014, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5564, 5014, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5565, 5014, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5566, 5014, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5567, 5014, 4, 3, 0)
GO
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5568, 5014, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5569, 5014, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5570, 5014, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5571, 5014, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5572, 5014, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5573, 5014, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5574, 5014, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5575, 5014, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5576, 5014, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5577, 5014, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5578, 5014, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5579, 5014, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5580, 5014, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5581, 5014, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5582, 5014, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5583, 5014, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5584, 5014, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5585, 5014, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5586, 5014, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5587, 5014, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5588, 5014, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5715, 5018, 1, 1, 89)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5716, 5018, 1, 2, 5)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5721, 5018, 2, 1, 119)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5722, 5018, 2, 2, 31)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5727, 5018, 3, 1, 97)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (5728, 5018, 3, 2, 5)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6085, 6003, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6086, 6003, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6087, 6003, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6088, 6003, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6089, 6003, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6090, 6003, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6091, 6003, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6092, 6003, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6093, 6003, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6094, 6003, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6095, 6003, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6096, 6003, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6097, 6003, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6098, 6003, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6099, 6003, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6100, 6003, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6101, 6003, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6102, 6003, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6103, 6003, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6104, 6003, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6105, 6003, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6106, 6003, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6107, 6003, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6108, 6003, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6109, 6003, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6110, 6003, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6111, 6003, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6112, 6003, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6113, 6003, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6114, 6003, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6115, 6003, 6, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6116, 6003, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6117, 6003, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6118, 6003, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6119, 6003, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6120, 6003, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6121, 6003, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6122, 6003, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6123, 6003, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6124, 6003, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6125, 6003, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6126, 6003, 7, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6295, 6008, 1, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6296, 6008, 1, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6297, 6008, 1, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6298, 6008, 1, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6299, 6008, 1, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6300, 6008, 1, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6301, 6008, 2, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6302, 6008, 2, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6303, 6008, 2, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6304, 6008, 2, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6305, 6008, 2, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6306, 6008, 2, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6307, 6008, 3, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6308, 6008, 3, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6309, 6008, 3, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6310, 6008, 3, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6311, 6008, 3, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6312, 6008, 3, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6313, 6008, 4, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6314, 6008, 4, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6315, 6008, 4, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6316, 6008, 4, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6317, 6008, 4, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6318, 6008, 4, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6319, 6008, 5, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6320, 6008, 5, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6321, 6008, 5, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6322, 6008, 5, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6323, 6008, 5, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6324, 6008, 5, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6325, 6008, 6, 1, 0)
GO
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6326, 6008, 6, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6327, 6008, 6, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6328, 6008, 6, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6329, 6008, 6, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6330, 6008, 6, 6, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6331, 6008, 7, 1, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6332, 6008, 7, 2, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6333, 6008, 7, 3, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6334, 6008, 7, 4, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6335, 6008, 7, 5, 0)
INSERT [dbo].[TblDet_TblMercadoNacional] ([PKId], [FKId_TblMercadoNacional], [FKId_TblDias], [FKId_TblCajasMercadoNacional], [Cantidad_Elaborado]) VALUES (6336, 6008, 7, 6, 0)
SET IDENTITY_INSERT [dbo].[TblDet_TblMercadoNacional] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDet_TblProduccion] ON 

INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (50, 8, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (51, 8, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (52, 8, 3, 200, 50, 150, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (53, 8, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (54, 8, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (55, 8, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (56, 8, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (57, 9, 1, 900, 20, 880, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (58, 9, 2, 750, 54, 696, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (59, 9, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (60, 9, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (61, 9, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (62, 9, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (63, 9, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (64, 10, 1, 200, 0, 200, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (65, 10, 2, 3000, 55, 2945, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (66, 10, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (67, 10, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (68, 10, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (69, 10, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (70, 10, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (78, 12, 1, 319, 0, 319, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (79, 12, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (80, 12, 3, 569, 0, 569, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (81, 12, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (82, 12, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (83, 12, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (84, 12, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1036, 1006, 1, 500, 0, 500, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1037, 1006, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1038, 1006, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1039, 1006, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1040, 1006, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1041, 1006, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (1042, 1006, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2015, 2003, 1, 2500, 1200, 1300, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2016, 2003, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2017, 2003, 3, 200, 0, 200, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2018, 2003, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2019, 2003, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2020, 2003, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2021, 2003, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2050, 2008, 1, 500, 0, 500, 1.97, 18.2, 20, 45.6, 1.7, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2051, 2008, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2052, 2008, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2053, 2008, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2054, 2008, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2055, 2008, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2056, 2008, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2071, 2011, 1, 3000, 0, 3000, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2072, 2011, 2, 5455, 0, 5455, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2073, 2011, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2074, 2011, 4, 500, 0, 500, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2075, 2011, 5, 10000, 7000, 3000, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2076, 2011, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (2077, 2011, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5092, 5014, 1, 871, 0, 871, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5093, 5014, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5094, 5014, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5095, 5014, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5096, 5014, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5097, 5014, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5098, 5014, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', NULL)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5120, 5018, 1, 1036, 0, 1036, 1.13, 11.24, 23.84, 22.28, 2.38, N'9-16-17', N'4-8-15-24', 40)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5121, 5018, 2, 1474, 0, 1474, 0.99, 13.02, 21.32, 36.11, 2.13, N'1-4-8-15-21-24', N'2-3-5-7-20-21', 500)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5122, 5018, 3, 1062, 0, 1062, 0.99, 11.57, 20.96, 35.36, 2.1, N'2-5-6-7-14-19-20', N'3-10-11-13-18', 55)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5123, 5018, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'90', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5124, 5018, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5125, 5018, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (5126, 5018, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6015, 6003, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6016, 6003, 2, 40, 0, 40, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6017, 6003, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6018, 6003, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6019, 6003, 5, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6020, 6003, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6021, 6003, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6050, 6008, 1, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6051, 6008, 2, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6052, 6008, 3, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6053, 6008, 4, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6054, 6008, 5, 88, 0, 88, 1, NULL, 18.69, 0, 1.87, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6055, 6008, 6, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
INSERT [dbo].[TblDet_TblProduccion] ([PKId], [FKId_TblProduccion], [FKId_TblDias], [Total_CE_Dia], [Total_CR_Dia], [Total_CEx_Dia], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Lotes_Cortados], [Lotes_Iniciados], [Fruta_Piso]) VALUES (6056, 6008, 7, 0, 0, 0, 0, NULL, NULL, 0, NULL, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[TblDet_TblProduccion] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDet_TblRacimos_TblDias] ON 

INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (50, 8, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (51, 8, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (52, 8, 3, 638, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (53, 8, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (54, 8, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (55, 8, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (56, 8, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (57, 9, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (58, 9, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (59, 9, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (60, 9, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (61, 9, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (62, 9, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (63, 9, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (64, 10, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (65, 10, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (66, 10, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (67, 10, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (68, 10, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (69, 10, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (70, 10, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (78, 12, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (79, 12, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (80, 12, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (81, 12, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (82, 12, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (83, 12, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (84, 12, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1036, 1006, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1037, 1006, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1038, 1006, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1039, 1006, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1040, 1006, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1041, 1006, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1042, 1006, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1106, 1016, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1107, 1016, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1108, 1016, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1109, 1016, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1110, 1016, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1111, 1016, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (1112, 1016, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2015, 2003, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2016, 2003, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2017, 2003, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2018, 2003, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2019, 2003, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2020, 2003, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2021, 2003, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2050, 2008, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2051, 2008, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2052, 2008, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2053, 2008, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2054, 2008, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2055, 2008, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2056, 2008, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2071, 2011, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2072, 2011, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2073, 2011, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2074, 2011, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2075, 2011, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2076, 2011, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (2077, 2011, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5092, 5014, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5093, 5014, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5094, 5014, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5095, 5014, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5096, 5014, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5097, 5014, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5098, 5014, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5120, 5018, 1, 896, 13, 34, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5121, 5018, 2, 1491, 16, 60, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5122, 5018, 3, 1078, 14, 34, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5123, 5018, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5124, 5018, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5125, 5018, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (5126, 5018, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6015, 6003, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6016, 6003, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6017, 6003, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6018, 6003, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6019, 6003, 5, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6020, 6003, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6021, 6003, 7, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6050, 6008, 1, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6051, 6008, 2, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6052, 6008, 3, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6053, 6008, 4, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6054, 6008, 5, 1, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6055, 6008, 6, 0, 0, 0, 0)
INSERT [dbo].[TblDet_TblRacimos_TblDias] ([PKId], [FKId_TblRacimos], [FKId_TblDias], [N_RacimosC_Dia], [N_RacimosR_Dia], [Total_PEmbarque], [Total_POtrasFincas]) VALUES (6056, 6008, 7, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[TblDet_TblRacimos_TblDias] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDias] ON 

INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (1, N'LUNES')
INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (2, N'MARTES')
INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (3, N'MIERCOLES')
INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (4, N'JUEVES')
INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (5, N'VIERNES')
INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (6, N'SABADO')
INSERT [dbo].[TblDias] ([PKId], [Descripcion]) VALUES (7, N'DOMINGO')
SET IDENTITY_INSERT [dbo].[TblDias] OFF
GO
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-20201', 1, N'2020')
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-20202', 2, N'2020')
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-202049', 49, N'2020')
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-20205', 5, N'2020')
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-202050', 50, N'2020')
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-20211', 57, N'2021')
INSERT [dbo].[TblEmbarque] ([PKCod], [FKId_TblSemanas], [Anho]) VALUES (N'EMB-202111', 67, N'2021')
GO
SET IDENTITY_INSERT [dbo].[TblEmbolse] ON 

INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (8, 1, 0, 7000)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (9, 2, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (10, 2, 0, 700)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (12, 2, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (1006, 2, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (1016, 1, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (2003, 1, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (2008, 49, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (2011, 2, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (5014, 49, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (5018, 50, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (6003, 67, 0, 0)
INSERT [dbo].[TblEmbolse] ([PKId], [FKId_TblSemanas], [N_PlantasPresente], [N_PlantasPrematuro]) VALUES (6008, 57, 100, 20)
SET IDENTITY_INSERT [dbo].[TblEmbolse] OFF
GO
INSERT [dbo].[TblEmpresas] ([PKNit], [Nombre], [Direccion], [Telefono]) VALUES (N'811032708-5', N'AGRÍCOLA GUAIMARAL S.A.S', N'CRA 99 NO. 105B-11 BARRIO ORTÍZ', N'2662861')
INSERT [dbo].[TblEmpresas] ([PKNit], [Nombre], [Direccion], [Telefono]) VALUES (N'900305092-2', N'AGRÍCOLA MONTESOL S.A.S', N'CALLE 18 NO. 35-69 AV. LAS PALMAS', N'2662861')
INSERT [dbo].[TblEmpresas] ([PKNit], [Nombre], [Direccion], [Telefono]) VALUES (N'900306440-7', N'AGRÍCOLA YUMANÁ S.A.S', N'CALLE 18 NO. 35-69 AV. LAS PALMAS', N'2662861')
INSERT [dbo].[TblEmpresas] ([PKNit], [Nombre], [Direccion], [Telefono]) VALUES (N'900645788-8', N'BANANERAS AGROFUTURO S.A.S', N'CALLE 18 NO. 35-69 AV. LAS PALMAS', N'2662861')
GO
SET IDENTITY_INSERT [dbo].[TblEstadoUsuario] ON 

INSERT [dbo].[TblEstadoUsuario] ([PKId], [Descripcion]) VALUES (1, N'ACTIVO')
INSERT [dbo].[TblEstadoUsuario] ([PKId], [Descripcion]) VALUES (2, N'INACTIVO')
SET IDENTITY_INSERT [dbo].[TblEstadoUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[TblEstimativo] ON 

INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (31, N'ZARZAMORA', 0, 0, N'EMB-20202')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (32, N'GUAIMARAL', 25, 30, N'EMB-20202')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (33, N'TAIWÁN', 0, 0, N'EMB-20202')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (34, N'CANDELARIA', 0, 0, N'EMB-20202')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (35, N'ÁLAMOS', 0, 0, N'EMB-20202')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (36, N'KALAMARÍ', 0, 0, N'EMB-20202')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (1043, N'ZARZAMORA', 4, 3, N'EMB-20201')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (1044, N'GUAIMARAL', 0, 0, N'EMB-20201')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (1045, N'TAIWÁN', 0, 0, N'EMB-20201')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (1046, N'CANDELARIA', 0, 0, N'EMB-20201')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (1047, N'ÁLAMOS', 0, 0, N'EMB-20201')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (1048, N'KALAMARÍ', 0, 0, N'EMB-20201')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (2037, N'ZARZAMORA', 2, 2, N'EMB-202049')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (2038, N'GUAIMARAL', 0, 0, N'EMB-202049')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (2039, N'TAIWÁN', 0, 0, N'EMB-202049')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (2040, N'CANDELARIA', 0, 0, N'EMB-202049')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (2041, N'ÁLAMOS', 0, 0, N'EMB-202049')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (2042, N'KALAMARÍ', 0, 0, N'EMB-202049')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (3043, N'ZARZAMORA', 3184, 0, N'EMB-202050')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (3044, N'GUAIMARAL', 2260, 0, N'EMB-202050')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (3045, N'TAIWÁN', 1817, 2, N'EMB-202050')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (3046, N'CANDELARIA', 3529, 0, N'EMB-202050')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (3047, N'ÁLAMOS', 4332, 0, N'EMB-202050')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (3048, N'KALAMARÍ', 1939, 0, N'EMB-202050')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5043, N'ZARZAMORA', 2, 2, N'EMB-202111')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5044, N'GUAIMARAL', 0, 0, N'EMB-202111')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5045, N'TAIWÁN', 5, 0, N'EMB-202111')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5046, N'CANDELARIA', 0, 0, N'EMB-202111')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5047, N'ÁLAMOS', 0, 0, N'EMB-202111')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5048, N'KALAMARÍ', 0, 0, N'EMB-202111')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5049, N'ZARZAMORA', 2, 2, N'EMB-20211')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5050, N'GUAIMARAL', 0, 0, N'EMB-20211')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5051, N'TAIWÁN', 0, 0, N'EMB-20211')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5052, N'CANDELARIA', 0, 0, N'EMB-20211')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5053, N'ÁLAMOS', 0, 0, N'EMB-20211')
INSERT [dbo].[TblEstimativo] ([PKId], [Finca], [Premiun], [Especial], [FKCod_TblEmbarque]) VALUES (5054, N'KALAMARÍ', 0, 0, N'EMB-20211')
SET IDENTITY_INSERT [dbo].[TblEstimativo] OFF
GO
INSERT [dbo].[TblFincas] ([PKIbm], [Nombre], [Area_Neta], [Area_Bruta], [FKNit_TblEmpresas]) VALUES (N'80004', N'TAIWAN', 64.21, 79.16, N'900306440-7')
INSERT [dbo].[TblFincas] ([PKIbm], [Nombre], [Area_Neta], [Area_Bruta], [FKNit_TblEmpresas]) VALUES (N'80008', N'KALAMARI', 61.08, 70.49, N'900306440-7')
INSERT [dbo].[TblFincas] ([PKIbm], [Nombre], [Area_Neta], [Area_Bruta], [FKNit_TblEmpresas]) VALUES (N'80009', N'ZARZAMORA', 58.33, 70.85, N'900305092-2')
INSERT [dbo].[TblFincas] ([PKIbm], [Nombre], [Area_Neta], [Area_Bruta], [FKNit_TblEmpresas]) VALUES (N'80074', N'ALAMOS', 128.47, 150.43, N'900645788-8')
INSERT [dbo].[TblFincas] ([PKIbm], [Nombre], [Area_Neta], [Area_Bruta], [FKNit_TblEmpresas]) VALUES (N'80075', N'CANDELARIA', 83.08, 100.83, N'900645788-8')
INSERT [dbo].[TblFincas] ([PKIbm], [Nombre], [Area_Neta], [Area_Bruta], [FKNit_TblEmpresas]) VALUES (N'85747', N'GUAIMARAL', 45.82, 57.9, N'811032708-5')
GO
SET IDENTITY_INSERT [dbo].[TblLotes] ON 

INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (1, N'Lote 1', 4.29, 4.94, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (2, N'Lote 2', 5.69, 6.49, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (3, N'Lote 3', 5.96, 6.78, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (4, N'Lote 4', 5.92, 6.42, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (5, N'Lote 5', 3.14, 3.94, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (6, N'Lote 6', 4.89, 0, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (7, N'Lote 7', 5.35, 0, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (8, N'Lote 8', 4.2, 0, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (9, N'Lote 9', 2.79, 0, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (10, N'Lote 10', 4.46, 5.25, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (11, N'Lote 11', 4.64, 5.58, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (12, N'Lote 12', 5.22, 7.09, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (13, N'Lote 13', 6.02, 7.31, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (14, N'Lote 14', 7.23, 8.43, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (15, N'Lote 15', 6.48, 7.38, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (16, N'Lote 16', 3.51, 3.92, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (17, N'Lote 17', 2.98, 3.47, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (18, N'Lote 18', 3.29, 4.57, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (19, N'Lote 19', 4.61, 5.07, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (20, N'Lote 20', 5.49, 6.14, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (21, N'Lote 21', 4.94, 5.56, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (22, N'Lote 22', 9.49, 11.05, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (23, N'Lote 23', 9.6, 10.33, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (24, N'Lote 24', 8.28, 9.7, N'80074')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (25, N'Lote 1', 6.08, 7.42, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (26, N'Lote 2', 3.28, 3.89, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (27, N'Lote 3', 4.45, 5.4, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (28, N'Lote 4', 4.83, 5.9, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (29, N'Lote 5', 4.23, 5.5, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (30, N'Lote 6', 4.57, 5.94, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (31, N'Lote 7', 4.75, 5.67, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (32, N'Lote 8', 6.24, 7.69, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (33, N'Lote 9', 3.87, 5.75, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (34, N'Lote 10', 3.75, 4.57, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (35, N'Lote 11', 4.18, 5.02, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (36, N'Lote 12', 3.78, 4.32, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (37, N'Lote 13', 3.2, 3.63, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (38, N'Lote 14', 2, 2.23, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (39, N'Lote 15', 3.2, 3.47, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (40, N'Lote 16', 5.21, 6.27, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (41, N'Lote 17', 5.83, 6.65, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (42, N'Lote 18', 7.15, 7.96, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (43, N'Lote 19', 2.48, 3.05, N'80075')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (44, N'Lote 1', 0.96, 1.22, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (45, N'Lote 2', 2.15, 2.67, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (46, N'Lote 3', 3.22, 3.84, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (47, N'Lote 4', 5.62, 6.55, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (48, N'Lote 5', 3.55, 4.33, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (49, N'Lote 6', 3.7, 4.72, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (50, N'Lote 7', 3.3, 4.57, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (51, N'Lote 8', 3.2, 4.4, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (52, N'Lote 9', 4.45, 5.54, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (53, N'Lote 10', 3.73, 4.72, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (54, N'Lote 11', 1.85, 2.19, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (55, N'Lote 12', 2.63, 3.14, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (56, N'Lote 13', 3.46, 4.32, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (57, N'Lote 14', 2.65, 4.03, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (58, N'Lote 15', 1.35, 1.66, N'85747')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (59, N'Lote 1', 3.68, 3.98, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (60, N'Lote 2', 3.42, 3.79, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (61, N'Lote 3', 1.61, 2.35, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (62, N'Lote 4', 5.34, 6.3, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (63, N'Lote 5', 6.83, 8.3, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (64, N'Lote 6', 5.27, 5.83, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (65, N'Lote 7', 4.52, 5.08, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (66, N'Lote 8', 1.25, 1.43, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (67, N'Lote 9', 3.06, 3.39, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (68, N'Lote 10', 3.66, 4.02, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (69, N'Lote 11', 3.6, 4.03, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (70, N'Lote 12', 4.18, 4.71, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (71, N'Lote 13', 2.57, 2.99, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (72, N'Lote 14', 2.45, 3.25, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (73, N'Lote 15', 2.78, 3.12, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (74, N'Lote 16', 3.56, 4.06, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (75, N'Lote 17', 3.3, 3.86, N'80008')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (76, N'Lote 1', 3.22, 4.31, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (77, N'Lote 2', 3.15, 3.89, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (78, N'Lote 3', 4.36, 5.2, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (79, N'Lote 4', 4.14, 5, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (80, N'Lote 5', 4.15, 5.03, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (81, N'Lote 6', 3.75, 4.78, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (82, N'Lote 7', 2.13, 2.54, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (83, N'Lote 8', 1.52, 1.84, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (84, N'Lote 9', 1.18, 1.5, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (85, N'Lote 10', 4.31, 5.13, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (86, N'Lote 11', 2.93, 3.6, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (87, N'Lote 12', 3.15, 4.02, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (88, N'Lote 13', 3.56, 4.34, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (89, N'Lote 14', 5, 5.93, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (90, N'Lote 15', 2.28, 2.82, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (91, N'Lote 16', 2.61, 3.23, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (92, N'Lote 17', 2.41, 2.99, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (93, N'Lote 18', 2.13, 2.63, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (94, N'Lote 19', 2.72, 3.56, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (95, N'Lote 20', 3.86, 4.71, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (96, N'Lote 21', 1.65, 2.11, N'80004')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (97, N'Lote 1', 0.74, 0.85, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (98, N'Lote 2', 1.01, 1.18, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (99, N'Lote 3', 2.14, 2.55, N'80009')
GO
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (100, N'Lote 4', 1.7, 1.95, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (101, N'Lote 5', 1.85, 2.17, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (102, N'Lote 6', 2.82, 3.23, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (103, N'Lote 7', 2.48, 2.96, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (104, N'Lote 8', 2.55, 3.04, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (105, N'Lote 9', 2.18, 2.53, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (106, N'Lote 10', 2.34, 2.79, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (107, N'Lote 11', 2.23, 2.63, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (108, N'Lote 12', 1.43, 1.78, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (109, N'Lote 13', 1.13, 1.37, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (110, N'Lote 14', 2.5, 3.12, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (111, N'Lote 15', 2.75, 3.3, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (112, N'Lote 16', 3.11, 3.83, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (113, N'Lote 17', 3.17, 4.02, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (114, N'Lote 18', 5.17, 6.44, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (115, N'Lote 19', 3.77, 4.77, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (116, N'Lote 20', 3.06, 3.63, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (117, N'Lote 21', 2.07, 2.46, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (118, N'Lote 22', 1.41, 1.71, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (119, N'Lote 23', 5.22, 6.86, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (120, N'Lote 24', 1.5, 1.68, N'80009')
INSERT [dbo].[TblLotes] ([PKId], [Lote], [Area_Neta], [Area_Bruta], [FKIbm_TblFincas]) VALUES (121, N'Lote 50', 50, 50, N'80074')
SET IDENTITY_INSERT [dbo].[TblLotes] OFF
GO
SET IDENTITY_INSERT [dbo].[TblMercadoNacional] ON 

INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (8, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (9, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (10, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (12, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1006, 1000)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1007, 1200)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1008, 1200)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1011, 3000)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1013, 1200)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1014, 1200)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1015, 30000)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1016, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1017, 3459)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (1018, 3459)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (2003, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (2008, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (2009, 150)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (2010, 150)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (2011, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5005, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5006, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5007, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5008, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5009, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5010, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5012, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5013, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5014, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (5018, 346)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (6003, 0)
INSERT [dbo].[TblMercadoNacional] ([PKId], [Total_Elaborado]) VALUES (6008, 0)
SET IDENTITY_INSERT [dbo].[TblMercadoNacional] OFF
GO
SET IDENTITY_INSERT [dbo].[TblProduccion] ON 

INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (8, N'80009', 8, 8, 1, 8, N'EMB-20201', 200, 50, 150, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (9, N'80008', 9, 9, 2, 9, N'EMB-20202', 1650, 74, 1576, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (10, N'80009', 10, 10, 2, 10, N'EMB-20202', 3200, 55, 3145, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (12, N'80075', 12, 12, 2, 12, N'EMB-20202', 888, 0, 888, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (1006, N'80004', 1006, 1006, 2, 1006, N'EMB-20202', 500, 0, 500, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (1016, N'80004', 1016, 1016, 1, 1016, N'EMB-20201', 0, 0, 0, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (2003, N'80074', 2003, 2003, 1, 2003, N'EMB-20201', 2700, 1200, 1500, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (2008, N'85747', 2008, 2008, 49, 2008, N'EMB-202049', 500, 0, 500, 1.97, 18.2, 20, 45.6, 1.7, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (2011, N'85747', 2011, 2011, 2, 2011, N'EMB-20202', 18955, 7000, 11955, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (5014, N'80074', 5014, 5014, 49, 5014, N'EMB-202049', 871, 0, 871, NULL, NULL, NULL, 0, NULL, N'2020', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (5018, N'80074', 5018, 5018, 50, 5018, N'EMB-202050', 3572, 0, 3572, 1.04, 11.94, 22.04, 93.75, 2.2, N'2020', 595, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (6003, N'80009', 6003, 6003, 67, 6003, N'EMB-202111', 40, 0, 40, NULL, NULL, NULL, 0, NULL, N'2021', NULL, NULL)
INSERT [dbo].[TblProduccion] ([PKId], [FKIbm_TblFincas], [FKId_TblEmbolse], [FKId_TblRacimos], [FKId_TblSemanas], [FKId_TblMercadoNacional], [Cod_Embarque], [Total_CElaboradas], [Total_CREchazadas], [Total_CExportadas], [Ratio], [Merma], [Peso_Racimos], [Area_Recorrida], [Peso_Vastago], [Anho_Produccion], [Fruta_Piso], [Conversion]) VALUES (6008, N'80004', 6008, 6008, 57, 6008, N'EMB-20211', 88, 0, 88, 1, NULL, 18.69, 0, 1.87, N'2021', NULL, 88)
SET IDENTITY_INSERT [dbo].[TblProduccion] OFF
GO
SET IDENTITY_INSERT [dbo].[TblRacimos] ON 

INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (8, 1, 638, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (9, 2, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (10, 2, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (12, 2, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (1006, 2, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (1016, 1, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (2003, 1, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (2008, 49, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (2011, 2, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (5014, 49, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (5018, 50, 3465, 43)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (6003, 67, 0, 0)
INSERT [dbo].[TblRacimos] ([PKId], [FKId_TblSemanas], [N_RacimosC], [N_RacimosR]) VALUES (6008, 57, 1, 0)
SET IDENTITY_INSERT [dbo].[TblRacimos] OFF
GO
SET IDENTITY_INSERT [dbo].[TblRegistroSemanas] ON 

INSERT [dbo].[TblRegistroSemanas] ([PKId], [Anho_generado]) VALUES (1, 2021)
SET IDENTITY_INSERT [dbo].[TblRegistroSemanas] OFF
GO
SET IDENTITY_INSERT [dbo].[TblSemanas] ON 

INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (1, N'SEMANA 1', CAST(N'2019-12-30' AS Date), CAST(N'2020-01-05' AS Date), 2020, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (2, N'SEMANA 2', CAST(N'2020-01-06' AS Date), CAST(N'2020-01-12' AS Date), 2020, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (3, N'SEMANA 3', CAST(N'2020-01-13' AS Date), CAST(N'2020-01-19' AS Date), 2020, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (4, N'SEMANA 4', CAST(N'2020-01-20' AS Date), CAST(N'2020-01-26' AS Date), 2020, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (5, N'SEMANA 5', CAST(N'2020-01-27' AS Date), CAST(N'2020-02-02' AS Date), 2020, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (6, N'SEMANA 6', CAST(N'2020-02-03' AS Date), CAST(N'2020-02-09' AS Date), 2020, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (7, N'SEMANA 7', CAST(N'2020-02-10' AS Date), CAST(N'2020-02-16' AS Date), 2020, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (8, N'SEMANA 8', CAST(N'2020-02-17' AS Date), CAST(N'2020-02-23' AS Date), 2020, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (9, N'SEMANA 9', CAST(N'2020-02-24' AS Date), CAST(N'2020-03-01' AS Date), 2020, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (10, N'SEMANA 10', CAST(N'2020-03-02' AS Date), CAST(N'2020-03-08' AS Date), 2020, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (11, N'SEMANA 11', CAST(N'2020-03-09' AS Date), CAST(N'2020-03-15' AS Date), 2020, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (12, N'SEMANA 12', CAST(N'2020-03-16' AS Date), CAST(N'2020-03-22' AS Date), 2020, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (13, N'SEMANA 13', CAST(N'2020-03-23' AS Date), CAST(N'2020-03-29' AS Date), 2020, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (14, N'SEMANA 14', CAST(N'2020-03-30' AS Date), CAST(N'2020-04-05' AS Date), 2020, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (15, N'SEMANA 15', CAST(N'2020-04-06' AS Date), CAST(N'2020-04-12' AS Date), 2020, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (16, N'SEMANA 16', CAST(N'2020-04-13' AS Date), CAST(N'2020-04-19' AS Date), 2020, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (17, N'SEMANA 17', CAST(N'2020-04-20' AS Date), CAST(N'2020-04-26' AS Date), 2020, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (18, N'SEMANA 18', CAST(N'2020-04-27' AS Date), CAST(N'2020-05-03' AS Date), 2020, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (19, N'SEMANA 19', CAST(N'2020-05-04' AS Date), CAST(N'2020-05-10' AS Date), 2020, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (20, N'SEMANA 20', CAST(N'2020-05-11' AS Date), CAST(N'2020-05-17' AS Date), 2020, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (21, N'SEMANA 21', CAST(N'2020-05-18' AS Date), CAST(N'2020-05-24' AS Date), 2020, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (22, N'SEMANA 22', CAST(N'2020-05-25' AS Date), CAST(N'2020-05-31' AS Date), 2020, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (23, N'SEMANA 23', CAST(N'2020-06-01' AS Date), CAST(N'2020-06-07' AS Date), 2020, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (24, N'SEMANA 24', CAST(N'2020-06-08' AS Date), CAST(N'2020-06-14' AS Date), 2020, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (25, N'SEMANA 25', CAST(N'2020-06-15' AS Date), CAST(N'2020-06-21' AS Date), 2020, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (26, N'SEMANA 26', CAST(N'2020-06-22' AS Date), CAST(N'2020-06-28' AS Date), 2020, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (27, N'SEMANA 27', CAST(N'2020-06-29' AS Date), CAST(N'2020-07-05' AS Date), 2020, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (28, N'SEMANA 28', CAST(N'2020-07-06' AS Date), CAST(N'2020-07-12' AS Date), 2020, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (29, N'SEMANA 29', CAST(N'2020-07-13' AS Date), CAST(N'2020-07-19' AS Date), 2020, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (30, N'SEMANA 30', CAST(N'2020-07-20' AS Date), CAST(N'2020-07-26' AS Date), 2020, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (31, N'SEMANA 31', CAST(N'2020-07-27' AS Date), CAST(N'2020-08-02' AS Date), 2020, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (32, N'SEMANA 32', CAST(N'2020-08-03' AS Date), CAST(N'2020-08-09' AS Date), 2020, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (33, N'SEMANA 33', CAST(N'2020-08-10' AS Date), CAST(N'2020-08-16' AS Date), 2020, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (34, N'SEMANA 34', CAST(N'2020-08-17' AS Date), CAST(N'2020-08-23' AS Date), 2020, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (35, N'SEMANA 35', CAST(N'2020-08-24' AS Date), CAST(N'2020-08-30' AS Date), 2020, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (36, N'SEMANA 36', CAST(N'2020-08-31' AS Date), CAST(N'2020-09-06' AS Date), 2020, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (37, N'SEMANA 37', CAST(N'2020-09-07' AS Date), CAST(N'2020-09-13' AS Date), 2020, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (38, N'SEMANA 38', CAST(N'2020-09-14' AS Date), CAST(N'2020-09-20' AS Date), 2020, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (39, N'SEMANA 39', CAST(N'2020-09-21' AS Date), CAST(N'2020-09-27' AS Date), 2020, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (40, N'SEMANA 40', CAST(N'2020-09-28' AS Date), CAST(N'2020-10-04' AS Date), 2020, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (41, N'SEMANA 41', CAST(N'2020-10-05' AS Date), CAST(N'2020-10-11' AS Date), 2020, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (42, N'SEMANA 42', CAST(N'2020-10-12' AS Date), CAST(N'2020-10-18' AS Date), 2020, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (43, N'SEMANA 43', CAST(N'2020-10-19' AS Date), CAST(N'2020-10-25' AS Date), 2020, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (44, N'SEMANA 44', CAST(N'2020-10-26' AS Date), CAST(N'2020-11-01' AS Date), 2020, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (45, N'SEMANA 45', CAST(N'2020-11-02' AS Date), CAST(N'2020-11-08' AS Date), 2020, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (46, N'SEMANA 46', CAST(N'2020-11-09' AS Date), CAST(N'2020-11-15' AS Date), 2020, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (47, N'SEMANA 47', CAST(N'2020-11-16' AS Date), CAST(N'2020-11-22' AS Date), 2020, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (48, N'SEMANA 48', CAST(N'2020-11-23' AS Date), CAST(N'2020-11-29' AS Date), 2020, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (49, N'SEMANA 49', CAST(N'2020-11-30' AS Date), CAST(N'2020-12-06' AS Date), 2020, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (50, N'SEMANA 50', CAST(N'2020-12-07' AS Date), CAST(N'2020-12-13' AS Date), 2020, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (51, N'SEMANA 51', CAST(N'2020-12-14' AS Date), CAST(N'2020-12-20' AS Date), 2020, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (52, N'SEMANA 52', CAST(N'2020-12-21' AS Date), CAST(N'2020-12-27' AS Date), 2020, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (56, N'SEMANA 53', CAST(N'2020-12-28' AS Date), CAST(N'2021-01-03' AS Date), 2020, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (57, N'SEMANA 1', CAST(N'2021-01-04' AS Date), CAST(N'2021-01-10' AS Date), 2021, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (58, N'SEMANA 2', CAST(N'2021-01-11' AS Date), CAST(N'2021-01-17' AS Date), 2021, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (59, N'SEMANA 3', CAST(N'2021-01-18' AS Date), CAST(N'2021-01-24' AS Date), 2021, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (60, N'SEMANA 4', CAST(N'2021-01-25' AS Date), CAST(N'2021-01-31' AS Date), 2021, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (61, N'SEMANA 5', CAST(N'2021-02-01' AS Date), CAST(N'2021-02-07' AS Date), 2021, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (62, N'SEMANA 6', CAST(N'2021-02-08' AS Date), CAST(N'2021-02-14' AS Date), 2021, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (63, N'SEMANA 7', CAST(N'2021-02-15' AS Date), CAST(N'2021-02-21' AS Date), 2021, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (64, N'SEMANA 8', CAST(N'2021-02-22' AS Date), CAST(N'2021-02-28' AS Date), 2021, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (65, N'SEMANA 9', CAST(N'2021-03-01' AS Date), CAST(N'2021-03-07' AS Date), 2021, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (66, N'SEMANA 10', CAST(N'2021-03-08' AS Date), CAST(N'2021-03-14' AS Date), 2021, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (67, N'SEMANA 11', CAST(N'2021-03-15' AS Date), CAST(N'2021-03-21' AS Date), 2021, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (68, N'SEMANA 12', CAST(N'2021-03-22' AS Date), CAST(N'2021-03-28' AS Date), 2021, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (69, N'SEMANA 13', CAST(N'2021-03-29' AS Date), CAST(N'2021-04-04' AS Date), 2021, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (70, N'SEMANA 14', CAST(N'2021-04-05' AS Date), CAST(N'2021-04-11' AS Date), 2021, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (71, N'SEMANA 15', CAST(N'2021-04-12' AS Date), CAST(N'2021-04-18' AS Date), 2021, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (72, N'SEMANA 16', CAST(N'2021-04-19' AS Date), CAST(N'2021-04-25' AS Date), 2021, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (73, N'SEMANA 17', CAST(N'2021-04-26' AS Date), CAST(N'2021-05-02' AS Date), 2021, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (74, N'SEMANA 18', CAST(N'2021-05-03' AS Date), CAST(N'2021-05-09' AS Date), 2021, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (75, N'SEMANA 19', CAST(N'2021-05-10' AS Date), CAST(N'2021-05-16' AS Date), 2021, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (76, N'SEMANA 20', CAST(N'2021-05-17' AS Date), CAST(N'2021-05-23' AS Date), 2021, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (77, N'SEMANA 21', CAST(N'2021-05-24' AS Date), CAST(N'2021-05-30' AS Date), 2021, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (78, N'SEMANA 22', CAST(N'2021-05-31' AS Date), CAST(N'2021-06-06' AS Date), 2021, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (79, N'SEMANA 23', CAST(N'2021-06-07' AS Date), CAST(N'2021-06-13' AS Date), 2021, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (80, N'SEMANA 24', CAST(N'2021-06-14' AS Date), CAST(N'2021-06-20' AS Date), 2021, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (81, N'SEMANA 25', CAST(N'2021-06-21' AS Date), CAST(N'2021-06-27' AS Date), 2021, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (82, N'SEMANA 26', CAST(N'2021-06-28' AS Date), CAST(N'2021-07-04' AS Date), 2021, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (83, N'SEMANA 27', CAST(N'2021-07-05' AS Date), CAST(N'2021-07-11' AS Date), 2021, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (84, N'SEMANA 28', CAST(N'2021-07-12' AS Date), CAST(N'2021-07-18' AS Date), 2021, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (85, N'SEMANA 29', CAST(N'2021-07-19' AS Date), CAST(N'2021-07-25' AS Date), 2021, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (86, N'SEMANA 30', CAST(N'2021-07-26' AS Date), CAST(N'2021-08-01' AS Date), 2021, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (87, N'SEMANA 31', CAST(N'2021-08-02' AS Date), CAST(N'2021-08-08' AS Date), 2021, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (88, N'SEMANA 32', CAST(N'2021-08-09' AS Date), CAST(N'2021-08-15' AS Date), 2021, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (89, N'SEMANA 33', CAST(N'2021-08-16' AS Date), CAST(N'2021-08-22' AS Date), 2021, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (90, N'SEMANA 34', CAST(N'2021-08-23' AS Date), CAST(N'2021-08-29' AS Date), 2021, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (91, N'SEMANA 35', CAST(N'2021-08-30' AS Date), CAST(N'2021-09-05' AS Date), 2021, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (92, N'SEMANA 36', CAST(N'2021-09-06' AS Date), CAST(N'2021-09-12' AS Date), 2021, 1)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (93, N'SEMANA 37', CAST(N'2021-09-13' AS Date), CAST(N'2021-09-19' AS Date), 2021, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (94, N'SEMANA 38', CAST(N'2021-09-20' AS Date), CAST(N'2021-09-26' AS Date), 2021, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (95, N'SEMANA 39', CAST(N'2021-09-27' AS Date), CAST(N'2021-10-03' AS Date), 2021, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (96, N'SEMANA 40', CAST(N'2021-10-04' AS Date), CAST(N'2021-10-10' AS Date), 2021, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (97, N'SEMANA 41', CAST(N'2021-10-11' AS Date), CAST(N'2021-10-17' AS Date), 2021, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (98, N'SEMANA 42', CAST(N'2021-10-18' AS Date), CAST(N'2021-10-24' AS Date), 2021, 7)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (99, N'SEMANA 43', CAST(N'2021-10-25' AS Date), CAST(N'2021-10-31' AS Date), 2021, 8)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (100, N'SEMANA 44', CAST(N'2021-11-01' AS Date), CAST(N'2021-11-07' AS Date), 2021, 9)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (101, N'SEMANA 45', CAST(N'2021-11-08' AS Date), CAST(N'2021-11-14' AS Date), 2021, 10)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (102, N'SEMANA 46', CAST(N'2021-11-15' AS Date), CAST(N'2021-11-21' AS Date), 2021, 1)
GO
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (103, N'SEMANA 47', CAST(N'2021-11-22' AS Date), CAST(N'2021-11-28' AS Date), 2021, 2)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (104, N'SEMANA 48', CAST(N'2021-11-29' AS Date), CAST(N'2021-12-05' AS Date), 2021, 3)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (105, N'SEMANA 49', CAST(N'2021-12-06' AS Date), CAST(N'2021-12-12' AS Date), 2021, 4)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (106, N'SEMANA 50', CAST(N'2021-12-13' AS Date), CAST(N'2021-12-19' AS Date), 2021, 5)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (107, N'SEMANA 51', CAST(N'2021-12-20' AS Date), CAST(N'2021-12-26' AS Date), 2021, 6)
INSERT [dbo].[TblSemanas] ([PKId], [N_Semana], [Fecha_Inicio], [Fecha_Fin], [Anho], [FKId_TblCintas]) VALUES (1053, N'SEMANA 52', CAST(N'2021-12-27' AS Date), CAST(N'2022-01-02' AS Date), 2021, 7)
SET IDENTITY_INSERT [dbo].[TblSemanas] OFF
GO
SET IDENTITY_INSERT [dbo].[TblTipoFruta] ON 

INSERT [dbo].[TblTipoFruta] ([PKId], [Descripcion]) VALUES (1, N'PRIMERA')
INSERT [dbo].[TblTipoFruta] ([PKId], [Descripcion]) VALUES (2, N'SEGUNDA')
INSERT [dbo].[TblTipoFruta] ([PKId], [Descripcion]) VALUES (3, N'ESPECIAL')
INSERT [dbo].[TblTipoFruta] ([PKId], [Descripcion]) VALUES (4, N'FRUTICA')
INSERT [dbo].[TblTipoFruta] ([PKId], [Descripcion]) VALUES (5, N'FRUTICA II')
INSERT [dbo].[TblTipoFruta] ([PKId], [Descripcion]) VALUES (6, N'FAIR TRADE')
SET IDENTITY_INSERT [dbo].[TblTipoFruta] OFF
GO
SET IDENTITY_INSERT [dbo].[TblTipoUsuario] ON 

INSERT [dbo].[TblTipoUsuario] ([PKId], [Descripcion]) VALUES (1, N'ADMINISTRADOR')
INSERT [dbo].[TblTipoUsuario] ([PKId], [Descripcion]) VALUES (2, N'ESTANDAR')
SET IDENTITY_INSERT [dbo].[TblTipoUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[TblUsuarios] ON 

INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (1, N'80074', N'alamos123', N'80074', 2, 1)
INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (2, N'80004', N'taiwan123', N'80004', 2, 1)
INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (3, N'80008', N'kalamari123', N'80008', 2, 1)
INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (4, N'80009', N'123456', N'80009', 2, 1)
INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (5, N'80075', N'candelaria123', N'80075', 2, 1)
INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (6, N'85747', N'123', N'85747', 2, 1)
INSERT [dbo].[TblUsuarios] ([PKId], [Usuario], [Password], [Ibm_Finca], [FKId_TblTipoUsuario], [FKId_TblEstadoUsuario]) VALUES (7, N'admin', N'valencia', NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[TblUsuarios] OFF
GO
ALTER TABLE [dbo].[TblCajasPlataforma]  WITH CHECK ADD FOREIGN KEY([FKId_TblMercadoNacional])
REFERENCES [dbo].[TblMercadoNacional] ([PKId])
GO
ALTER TABLE [dbo].[TblCajasProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblTipoFruta])
REFERENCES [dbo].[TblTipoFruta] ([PKId])
GO
ALTER TABLE [dbo].[TblCargue]  WITH CHECK ADD FOREIGN KEY([FKCod_TblEmbarque])
REFERENCES [dbo].[TblEmbarque] ([PKCod])
GO
ALTER TABLE [dbo].[TblCargue]  WITH CHECK ADD FOREIGN KEY([FKIbm_TblFincas])
REFERENCES [dbo].[TblFincas] ([PKIbm])
GO
ALTER TABLE [dbo].[TblDet_TblDet_TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKCodigo_TblCajasProduccion])
REFERENCES [dbo].[TblCajasProduccion] ([PKCodigo])
GO
ALTER TABLE [dbo].[TblDet_TblDet_TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblDet_TblProduccion])
REFERENCES [dbo].[TblDet_TblProduccion] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblDet_TblRacimos_TblDias]  WITH CHECK ADD FOREIGN KEY([FKId_TblDet_TblRacimos_TblDias])
REFERENCES [dbo].[TblDet_TblRacimos_TblDias] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblDet_TblRacimos_TblDias]  WITH CHECK ADD FOREIGN KEY([FKId_TblCintas])
REFERENCES [dbo].[TblCintas] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblEmbarque]  WITH CHECK ADD FOREIGN KEY([FKCod_TblEmbarque])
REFERENCES [dbo].[TblEmbarque] ([PKCod])
GO
ALTER TABLE [dbo].[TblDet_TblEmbarque]  WITH CHECK ADD FOREIGN KEY([FKCodigo_TblCajasProduccion])
REFERENCES [dbo].[TblCajasProduccion] ([PKCodigo])
GO
ALTER TABLE [dbo].[TblDet_TblEmbarque]  WITH CHECK ADD FOREIGN KEY([FKIbm_TblFincas])
REFERENCES [dbo].[TblFincas] ([PKIbm])
GO
ALTER TABLE [dbo].[TblDet_TblMercadoNacional]  WITH CHECK ADD FOREIGN KEY([FKId_TblMercadoNacional])
REFERENCES [dbo].[TblMercadoNacional] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblMercadoNacional]  WITH CHECK ADD FOREIGN KEY([FKId_TblDias])
REFERENCES [dbo].[TblDias] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblMercadoNacional]  WITH CHECK ADD FOREIGN KEY([FKId_TblCajasMercadoNacional])
REFERENCES [dbo].[TblCajasMercadoNacional] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblProduccion])
REFERENCES [dbo].[TblProduccion] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblDias])
REFERENCES [dbo].[TblDias] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblRacimos_TblDias]  WITH CHECK ADD FOREIGN KEY([FKId_TblRacimos])
REFERENCES [dbo].[TblRacimos] ([PKId])
GO
ALTER TABLE [dbo].[TblDet_TblRacimos_TblDias]  WITH CHECK ADD FOREIGN KEY([FKId_TblDias])
REFERENCES [dbo].[TblDias] ([PKId])
GO
ALTER TABLE [dbo].[TblEmbarque]  WITH CHECK ADD FOREIGN KEY([FKId_TblSemanas])
REFERENCES [dbo].[TblSemanas] ([PKId])
GO
ALTER TABLE [dbo].[TblEmbolse]  WITH CHECK ADD FOREIGN KEY([FKId_TblSemanas])
REFERENCES [dbo].[TblSemanas] ([PKId])
GO
ALTER TABLE [dbo].[TblEstimativo]  WITH CHECK ADD FOREIGN KEY([FKCod_TblEmbarque])
REFERENCES [dbo].[TblEmbarque] ([PKCod])
GO
ALTER TABLE [dbo].[TblFincas]  WITH CHECK ADD FOREIGN KEY([FKNit_TblEmpresas])
REFERENCES [dbo].[TblEmpresas] ([PKNit])
GO
ALTER TABLE [dbo].[TblLotes]  WITH CHECK ADD FOREIGN KEY([FKIbm_TblFincas])
REFERENCES [dbo].[TblFincas] ([PKIbm])
GO
ALTER TABLE [dbo].[TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKIbm_TblFincas])
REFERENCES [dbo].[TblFincas] ([PKIbm])
GO
ALTER TABLE [dbo].[TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblEmbolse])
REFERENCES [dbo].[TblEmbolse] ([PKId])
GO
ALTER TABLE [dbo].[TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblRacimos])
REFERENCES [dbo].[TblRacimos] ([PKId])
GO
ALTER TABLE [dbo].[TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblSemanas])
REFERENCES [dbo].[TblSemanas] ([PKId])
GO
ALTER TABLE [dbo].[TblProduccion]  WITH CHECK ADD FOREIGN KEY([FKId_TblMercadoNacional])
REFERENCES [dbo].[TblMercadoNacional] ([PKId])
GO
ALTER TABLE [dbo].[TblRacimos]  WITH CHECK ADD FOREIGN KEY([FKId_TblSemanas])
REFERENCES [dbo].[TblSemanas] ([PKId])
GO
ALTER TABLE [dbo].[TblSemanas]  WITH CHECK ADD FOREIGN KEY([FKId_TblCintas])
REFERENCES [dbo].[TblCintas] ([PKId])
GO
ALTER TABLE [dbo].[TblUsuarios]  WITH CHECK ADD FOREIGN KEY([FKId_TblTipoUsuario])
REFERENCES [dbo].[TblTipoUsuario] ([PKId])
GO
ALTER TABLE [dbo].[TblUsuarios]  WITH CHECK ADD FOREIGN KEY([FKId_TblEstadoUsuario])
REFERENCES [dbo].[TblEstadoUsuario] ([PKId])
GO
USE [master]
GO
ALTER DATABASE [bdspmontesol] SET  READ_WRITE 
GO
