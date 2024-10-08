USE [master]
GO
/****** Object:  Database [bdspmontesol]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  User [usermontesol]    Script Date: 13/03/2021 8:20:28 ******/
CREATE USER [usermontesol] FOR LOGIN [usermontesol] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[TblCajasMercadoNacional]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblCajasPlataforma]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblCajasProduccion]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblCargue]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblCintas]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDet_TblDet_TblProduccion]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDet_TblDet_TblRacimos_TblDias]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDet_TblEmbarque]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDet_TblMercadoNacional]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDet_TblProduccion]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDet_TblRacimos_TblDias]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblDias]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblEmbarque]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblEmbolse]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblEmpresas]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblEstadoUsuario]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblEstimativo]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblFincas]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblLotes]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblMercadoNacional]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblProduccion]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblRacimos]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblRegistroSemanas]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblSemanas]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblTipoFruta]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblTipoUsuario]    Script Date: 13/03/2021 8:20:28 ******/
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
/****** Object:  Table [dbo].[TblUsuarios]    Script Date: 13/03/2021 8:20:28 ******/
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
