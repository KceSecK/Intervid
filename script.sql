create table arealaboral
(
    AreaLaboralID bigint auto_increment
        primary key,
    NombreArea    varchar(200) null
);

create table idioma
(
    IdiomaID     bigint auto_increment
        primary key,
    NombreIdioma varchar(200) null
);

create table mediopago
(
    MedioPagoID     bigint auto_increment
        primary key,
    MedioPagoNombre varchar(100) null
);

create table pais
(
    PaisID     bigint auto_increment
        primary key,
    PaisNombre varchar(50) not null
);

create table plan
(
    PlanID       bigint auto_increment
        primary key,
    NombrePlan   varchar(200)         null,
    PrecioPlan   int                  null,
    DuracionPlan int                  null,
    EstadoPlan   tinyint(1) default 0 null,
    TipoPlan     varchar(100)         null
);

create table privilegioadministrador
(
    PrivilegioAdministradorID bigint auto_increment
        primary key,
    TipoPrivilegio            varchar(100) null
);

create table region
(
    RegionID     bigint auto_increment
        primary key,
    RegionPaisFK bigint default 0 null,
    RegionNombre varchar(50)      not null,
    constraint FK_Region_Pais
        foreign key (RegionPaisFK) references pais (PaisID)
            on update cascade
);

create table comuna
(
    ComunaID       bigint auto_increment
        primary key,
    ComunaRegionFK bigint default 0 null,
    ComunaNombre   varchar(50)      not null,
    constraint FK_Comuna_Region
        foreign key (ComunaRegionFK) references region (RegionID)
            on update cascade
);

create table tipoentrevista
(
    TipoEntrevistaID bigint auto_increment
        primary key,
    TipoEntrevista   varchar(200) null
);

create table usuario
(
    UsuarioID       bigint auto_increment
        primary key,
    CorreoUsuario   varchar(50)                            not null,
    Contraseña      varbinary(256)                         not null,
    TipoCuenta      varchar(20)                            not null,
    NombreUsuario   varchar(200)                           null,
    ApellidoUsuario varchar(200)                           null,
    CuentaActiva    tinyint(1) default 1                   null,
    FechaRegistro   datetime   default current_timestamp() null,
    constraint AK_UsuarioCorreo
        unique (CorreoUsuario)
);

create table notificaciones
(
    NotificacionesID    bigint auto_increment
        primary key,
    UsuarioDestino      bigint     default 0                   null,
    DetalleNotificacion varchar(500)                           null,
    EstadoNotificacion  tinyint(1) default 0                   null,
    FechaNotificacion   datetime   default current_timestamp() null,
    NotificacionLink    varchar(3000)                          null,
    constraint FK_Notificacion_Usuario
        foreign key (UsuarioDestino) references usuario (UsuarioID)
            on update cascade
);

create table numerocontacto
(
    NumeroContactoID bigint auto_increment
        primary key,
    NumeroUsuarioFK  bigint default 0 null,
    ContactoTipo     varchar(100)     null,
    NumeroTelefonico varchar(50)      null,
    constraint FK_Numero_Usuario
        foreign key (NumeroUsuarioFK) references usuario (UsuarioID)
            on update cascade
);

create table transaccion
(
    NumeroTransaccionID bigint                               not null
        primary key,
    Cliente             bigint                               null,
    TipoCuentaCliente   varchar(100)                         null,
    NumeroCuentaCliente varchar(100)                         null,
    MedioPago           bigint                               null,
    FechaTransaccion    datetime default current_timestamp() null,
    TotalPago           bigint                               null,
    constraint FK_Transaccion_Cliente
        foreign key (Cliente) references usuario (UsuarioID)
            on update cascade,
    constraint FK_Transaccion_Pago
        foreign key (MedioPago) references mediopago (MedioPagoID)
            on update cascade
);

create table detalletransaccion
(
    DetalleTransaccionID bigint auto_increment
        primary key,
    PlanAdquirido        bigint   default 0                   null,
    NumeroTransaccion    bigint   default 0                   null,
    TotalParcial         bigint   default 0                   null,
    FechaPago            datetime default current_timestamp() null,
    constraint AK_NumeroTransaccion
        unique (NumeroTransaccion),
    constraint FK_DetalleTransaccion_Plan
        foreign key (PlanAdquirido) references plan (PlanID)
            on update cascade,
    constraint FK_Detalle_Transaccion
        foreign key (NumeroTransaccion) references transaccion (NumeroTransaccionID)
            on update cascade
);

create table usuarioadministrador
(
    UsuarioAdministradorID bigint auto_increment
        primary key,
    AdministradorUsuarioFK bigint default 0 null,
    Detalle                varchar(200)     null,
    constraint AK_AdministradorUsuario
        unique (AdministradorUsuarioFK),
    constraint FK_Admin_Usuario
        foreign key (AdministradorUsuarioFK) references usuario (UsuarioID)
            on update cascade
);

create table usuarioempresa
(
    UsuarioEmpresaID   bigint auto_increment
        primary key,
    EmpresaUsuarioFK   bigint default 0 null,
    NombreEmpresa      varchar(200)     null,
    RazonSocial        varchar(200)     null,
    RutEmpresa         varchar(20)      null,
    EmpresaPais        bigint           null,
    EmpresaDireccion   varchar(200)     null,
    SectorEmpresarial  varchar(200)     null,
    LogoEmpresa        varchar(3000)    null,
    PaginaWeb          varchar(300)     null,
    DescripcionEmpresa varchar(2000)    null,
    constraint AK_RutEmpresa
        unique (RutEmpresa),
    constraint AK_UsuarioEmpresa
        unique (EmpresaUsuarioFK),
    constraint FK_Empresa_Pais
        foreign key (EmpresaPais) references pais (PaisID)
            on update cascade,
    constraint FK_Empresa_Usuario
        foreign key (EmpresaUsuarioFK) references usuario (UsuarioID)
            on update cascade
);

create table ofertalaboral
(
    OfertaLaboralID         bigint auto_increment
        primary key,
    NombreOferta            varchar(200)                         null,
    CreadorOferta           bigint   default 0                   null,
    EmpresaOferta           bigint   default 0                   null,
    LugarTrabajo            bigint   default 0                   null,
    TipoEntrevista          bigint   default 0                   null,
    PlanOferta              bigint   default 0                   null,
    DescripcionCargo        varchar(2002)                        null,
    FechaPublicacionOferta  datetime default current_timestamp() null,
    FechaFinalizacionOferta datetime                             null,
    RequisitosOferta        varchar(5002)                        null,
    BeneficiosOferta        varchar(5002)                        null,
    HorarioEntrevistaInicio time                                 null,
    HorarioEntrevistaFin    time                                 null,
    TipoCargo               varchar(100)                         null,
    TipoContrato            varchar(100)                         null,
    JornadaTrabajo          varchar(100)                         null,
    SueldoOfrecido          int                                  null,
    constraint FK_Direccion_Empresa
        foreign key (LugarTrabajo) references comuna (ComunaID)
            on update cascade,
    constraint FK_Nombre_Empresa
        foreign key (EmpresaOferta) references usuarioempresa (UsuarioEmpresaID)
            on update cascade,
    constraint FK_Oferta_Creador
        foreign key (CreadorOferta) references usuario (UsuarioID)
            on update cascade,
    constraint FK_Tipo_Entrevista
        foreign key (TipoEntrevista) references tipoentrevista (TipoEntrevistaID)
            on update cascade
);

create table usuariopostulante
(
    UsuarioPostulanteID bigint auto_increment
        primary key,
    PostulanteUsuarioFK bigint     default 0 null,
    Genero              varchar(20)          null,
    Nacionalidad        varchar(20)          null,
    Documento           varchar(20)          null,
    NumDocumento        varchar(20)          null,
    FechaNacimiento     date                 null,
    EstadoCivil         varchar(20)          null,
    VehiculoUsuario     tinyint(1) default 0 null,
    DiscapacidadUsuario tinyint(1) default 0 null,
    constraint AK_DatosUsuario
        unique (PostulanteUsuarioFK),
    constraint FK_Datos_Usuario
        foreign key (PostulanteUsuarioFK) references usuario (UsuarioID)
            on update cascade
);

create table contactopostulante
(
    ContactoPostulanteID bigint auto_increment
        primary key,
    ContactoPostulanteFK bigint default 0 null,
    ComunaResidencia     bigint           null,
    DireccionResidencia  varchar(200)     null,
    CorreoContacto       varchar(200)     null,
    constraint AK_ContactoPostulante
        unique (ContactoPostulanteFK),
    constraint FK_Contacto_Postulante
        foreign key (ContactoPostulanteFK) references usuariopostulante (UsuarioPostulanteID)
            on update cascade,
    constraint FK_Residencia_Postulante
        foreign key (ComunaResidencia) references comuna (ComunaID)
            on update cascade
);

create table educacionpostulante
(
    EducacionPostulanteID bigint auto_increment
        primary key,
    EducacionPostulanteFK bigint     default 0 null,
    Institucion           varchar(100)         null,
    NivelEstudio          varchar(100)         null,
    EstadoEstudio         varchar(50)          null,
    PeriodoInicio         date                 null,
    PeriodoFin            date                 null,
    PeriodoActual         tinyint(1) default 0 null,
    constraint FK_Educacion_Postulante
        foreign key (EducacionPostulanteFK) references usuariopostulante (UsuarioPostulanteID)
            on update cascade
);

create table expectativalaboral
(
    ExpectativaLaboralID    bigint auto_increment
        primary key,
    ExpectativaPostulanteFK bigint     default 0 null,
    RegionPreferente        bigint               null,
    ExpectativaRenta        bigint               null,
    TipoMoneda              varchar(100)         null,
    JornadaPreferente       varchar(100)         null,
    DisponibilidadViaje     tinyint(1) default 0 null,
    CambioResidencia        tinyint(1) default 0 null,
    constraint FK_Expectativa_Postulante
        foreign key (ExpectativaPostulanteFK) references usuariopostulante (UsuarioPostulanteID)
            on update cascade,
    constraint FK_Expectativa_Region
        foreign key (RegionPreferente) references region (RegionID)
            on update cascade
);

create table experienciaprofesional
(
    ExperienciaProfesionalID bigint auto_increment
        primary key,
    ExperienciaPostulanteFK  bigint default 0 null,
    EmpresaExperiencia       varchar(200)     null,
    CargoDesempeñado         varchar(200)     null,
    InicioPeriodo            date             null,
    FinPeriodo               date             null,
    FuncionesLogros          varchar(3000)    null,
    constraint FK_Experiencia_Postulante
        foreign key (ExperienciaPostulanteFK) references usuariopostulante (UsuarioPostulanteID)
            on update cascade
);

create table idiomapostulante
(
    IdiomaPostulanteID bigint auto_increment
        primary key,
    PostulanteIdiomaFK bigint default 0 null,
    IdiomaFK           bigint           null,
    NivelEscrito       varchar(200)     null,
    NivelHablado       varchar(200)     null,
    constraint FK_Idioma_Postulante
        foreign key (IdiomaFK) references idioma (IdiomaID)
            on update cascade,
    constraint FK_Postulante_Idioma
        foreign key (PostulanteIdiomaFK) references usuariopostulante (UsuarioPostulanteID)
            on update cascade
);

create table licencia
(
    LicenciaID           bigint auto_increment
        primary key,
    LicenciaPostulanteFK bigint     default 0 null,
    LicenciaTipoA1       tinyint(1) default 0 null,
    LicenciaTipoA2       tinyint(1) default 0 null,
    LicenciaTipoA3       tinyint(1) default 0 null,
    LicenciaTipoA4       tinyint(1) default 0 null,
    LicenciaTipoA5       tinyint(1) default 0 null,
    LicenciaTipoB        tinyint(1) default 0 null,
    LicenciaTipoC        tinyint(1) default 0 null,
    LicenciaTipoD        tinyint(1) default 0 null,
    LicenciaTipoE        tinyint(1) default 0 null,
    LicenciaTipoF        tinyint(1) default 0 null,
    NoLicencia           tinyint(1) default 0 null,
    constraint FK_Licencia_Usuario
        foreign key (LicenciaPostulanteFK) references usuariopostulante (UsuarioPostulanteID)
            on update cascade
);

create table otrosconocimientos
(
    OtrosConocimientosID   bigint auto_increment
        primary key,
    ConocimientoPostulante bigint default 0 null,
    Conocimiento           varchar(200)     null,
    constraint FK_Conocimiento_Postulante
        foreign key (ConocimientoPostulante) references usuariopostulante (UsuarioPostulanteID)
            on update cascade
);

create table usuarioreclutador
(
    UsuarioReclutadorID bigint auto_increment
        primary key,
    EmpresaAsociadaFK   bigint       null,
    CuentaReclutador    bigint       null,
    ReclutadorCargo     varchar(100) null,
    ReclutadorGenero    varchar(20)  null,
    constraint FK_Cuenta_Reclutador
        foreign key (CuentaReclutador) references usuario (UsuarioID)
            on update cascade,
    constraint FK_Empresa_Reclutador
        foreign key (EmpresaAsociadaFK) references usuarioempresa (UsuarioEmpresaID)
            on update cascade
);

create definer = root@`%` view v_empresa as
select `intervid_db`.`usuario`.`UsuarioID`       AS `UsuarioID`,
       `intervid_db`.`usuario`.`CorreoUsuario`   AS `CorreoUsuario`,
       `intervid_db`.`usuario`.`NombreUsuario`   AS `NombreUsuario`,
       `intervid_db`.`usuario`.`ApellidoUsuario` AS `ApellidoUsuario`,
       `u`.`UsuarioEmpresaID`                    AS `UsuarioEmpresaID`,
       `u`.`NombreEmpresa`                       AS `NombreEmpresa`,
       `u`.`RazonSocial`                         AS `RazonSocial`,
       `u`.`RutEmpresa`                          AS `RutEmpresa`,
       `u`.`EmpresaPais`                         AS `EmpresaPais`,
       `u`.`EmpresaDireccion`                    AS `EmpresaDireccion`,
       `u`.`SectorEmpresarial`                   AS `SectorEmpresarial`,
       `u`.`LogoEmpresa`                         AS `LogoEmpresa`,
       `u`.`PaginaWeb`                           AS `PaginaWeb`,
       `u`.`DescripcionEmpresa`                  AS `DescripcionEmpresa`,
       `p`.`PaisID`                              AS `PaisID`,
       `p`.`PaisNombre`                          AS `PaisNombre`,
       `n`.`NumeroContactoID`                    AS `NumeroContactoID`,
       `n`.`ContactoTipo`                        AS `ContactoTipo`,
       `n`.`NumeroTelefonico`                    AS `NumeroTelefonico`
from (((`intervid_db`.`usuario` left join `intervid_db`.`usuarioempresa` `u` on (`intervid_db`.`usuario`.`UsuarioID` = `u`.`EmpresaUsuarioFK`)) left join `intervid_db`.`pais` `p` on (`u`.`EmpresaPais` = `p`.`PaisID`))
         left join `intervid_db`.`numerocontacto` `n` on (`intervid_db`.`usuario`.`UsuarioID` = `n`.`NumeroUsuarioFK`))
where `intervid_db`.`usuario`.`TipoCuenta` = 'Empresa';

create definer = root@`%` view v_reclutadores as
select `intervid_db`.`usuario`.`UsuarioID`                     AS `UsuarioID`,
       `intervid_db`.`usuario`.`CorreoUsuario`                 AS `CorreoUsuario`,
       `intervid_db`.`usuario`.`NombreUsuario`                 AS `NombreUsuario`,
       `intervid_db`.`usuario`.`ApellidoUsuario`               AS `ApellidoUsuario`,
       `intervid_db`.`usuario`.`CuentaActiva`                  AS `CuentaActiva`,
       `intervid_db`.`usuarioreclutador`.`UsuarioReclutadorID` AS `UsuarioReclutadorID`,
       `intervid_db`.`usuarioreclutador`.`ReclutadorCargo`     AS `ReclutadorCargo`,
       `intervid_db`.`usuarioreclutador`.`ReclutadorGenero`    AS `ReclutadorGenero`,
       `intervid_db`.`usuarioreclutador`.`EmpresaAsociadaFK`   AS `EmpresaAsociadaFK`
from `intervid_db`.`usuario`
         join `intervid_db`.`usuarioreclutador`
where `intervid_db`.`usuarioreclutador`.`CuentaReclutador` = `intervid_db`.`usuario`.`UsuarioID`;

create definer = root@`%` view v_regionofertas as
select distinct `regionofertas`.`RegionID`             AS `RegionID`,
                `regionofertas`.`RegionNombre`         AS `RegionNombre`,
                `regionofertas`.`RegionPaisFK`         AS `RegionPaisFK`,
                `regionofertas`.`Ofertas`              AS `Ofertas`,
                sum(`regionofertas`.`Ofertas`) over () AS `Total`
from (select `intervid_db`.`region`.`RegionID`            AS `RegionID`,
             `intervid_db`.`region`.`RegionNombre`        AS `RegionNombre`,
             `intervid_db`.`region`.`RegionPaisFK`        AS `RegionPaisFK`,
             count(`intervid_db`.`region`.`RegionNombre`) AS `Ofertas`
      from `intervid_db`.`ofertalaboral`
               join `intervid_db`.`region`
               join `intervid_db`.`comuna`
      where `intervid_db`.`comuna`.`ComunaRegionFK` = `intervid_db`.`region`.`RegionID`
        and `intervid_db`.`ofertalaboral`.`LugarTrabajo` = `intervid_db`.`comuna`.`ComunaID`
      group by `intervid_db`.`region`.`RegionID`
      union all
      select distinct `intervid_db`.`region`.`RegionID`     AS `RegionID`,
                      `intervid_db`.`region`.`RegionNombre` AS `RegionNombre`,
                      `intervid_db`.`region`.`RegionPaisFK` AS `RegionPaisFK`,
                      0                                     AS `0`
      from `intervid_db`.`region`) `regionofertas`
group by `regionofertas`.`RegionNombre`
order by `regionofertas`.`RegionID`;

create
    definer = root@`%` procedure creacion_UsuarioEmpresa(IN UEcorreo varchar(50), IN UEcontraseña varbinary(256),
                                                         IN UEnombre varchar(200), IN UEapellido varchar(200),
                                                         IN UErazonSocial varchar(200), IN UErutEmpresa varchar(20),
                                                         IN UEnombreEmpresa varchar(200), IN UEtelefono varchar(50))
BEGIN
    DECLARE poid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;

    INSERT INTO usuario (correoUsuario, Contraseña, TipoCuenta, NombreUsuario, ApellidoUsuario)
    VALUES (UEcorreo, UEcontraseña, 'Empresa', UEnombre, UEapellido);

    SET poid = (SELECT UsuarioID FROM Usuario WHERE CorreoUsuario = UEcorreo);
    SELECT (poid);

    INSERT INTO UsuarioEmpresa (EmpresaUsuarioFK, NombreEmpresa, RazonSocial, RutEmpresa)
    VALUES (poid, UEnombreEmpresa, UErazonSocial, UErutEmpresa);

    INSERT INTO numerocontacto (NumeroUsuarioFK, NumeroTelefonico) VALUES (poid, UEtelefono);

    COMMIT WORK;
END;

create
    definer = root@`%` procedure creacion_UsuarioPostulante(IN UPcorreo varchar(50), IN UPcontraseña varbinary(256),
                                                            IN UPnombre varchar(200), IN UPapellido varchar(200))
BEGIN
    DECLARE poid INT;
    DECLARE poid2 INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;
    INSERT INTO usuario (correoUsuario, Contraseña, TipoCuenta, NombreUsuario, ApellidoUsuario)
    VALUES (UPcorreo, UPcontraseña, 'Postulante', UPnombre, UPapellido);
    SET poid = (SELECT LAST_INSERT_ID());
    INSERT INTO usuariopostulante (PostulanteUsuarioFK) VALUES (poid);
    SET poid2 = (SELECT LAST_INSERT_ID());
    INSERT INTO expectativalaboral(ExpectativaPostulanteFK) VALUES (poid2);
    INSERT INTO licencia (LicenciaPostulanteFK) VALUES (poid2);
    INSERT INTO contactopostulante (ContactoPostulanteFK) VALUES (poid2);

    COMMIT WORK;
END;

create
    definer = root@`%` procedure creacion_UsuarioReclutador(IN URcorreo varchar(50), IN URcontraseña varchar(72),
                                                            IN URnombre varchar(200), IN URapellido varchar(200),
                                                            IN URempresa varchar(200), IN URgenero varchar(20),
                                                            IN URcargo varchar(100))
BEGIN
    DECLARE poid INT;
    DECLARE emid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;

    INSERT INTO usuario (correoUsuario, Contraseña, TipoCuenta, NombreUsuario, ApellidoUsuario)
    VALUES (URcorreo, URcontraseña, 'Reclutador', URnombre, URapellido);
    SELECT ("primero insert");
    SET poid = (SELECT UsuarioID FROM Usuario WHERE CorreoUsuario = URcorreo);
    SELECT ("primero set");
    SET emid = (SELECT UsuarioEmpresaID
                FROM usuarioempresa,
                     usuario
                WHERE CorreoUsuario = URempresa
                  AND UsuarioID = EmpresaUsuarioFK);
    SELECT emid;
    SELECT ("segundo set");
    INSERT INTO UsuarioReclutador (EmpresaAsociadaFK, CuentaReclutador, ReclutadorCargo, ReclutadorGenero)
    VALUES (emid, poid, URcargo, URgenero);
    SELECT ("segundo insert");
    COMMIT WORK;

END;

create
    definer = root@`%` procedure creacion_educacionPostulante(IN EdPosFK int, IN Institucion varchar(100),
                                                              IN NivelEstudio varchar(100),
                                                              IN EstadoEstudio varchar(50), IN PeriodoInicio date,
                                                              IN PeriodoFin date, IN PeriodoActual tinyint)
BEGIN
    DECLARE poid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;
    INSERT INTO educacionpostulante(EducacionPostulanteFK, Institucion, NivelEstudio, EstadoEstudio, PeriodoInicio,
                                    PeriodoFin, PeriodoActual)
    VALUES (EdPosFK, Institucion, NivelEstudio, EstadoEstudio, PeriodoInicio, PeriodoFin, PeriodoActual);


    COMMIT WORK;

END;

create
    definer = root@`%` procedure edit_datosContactoPostulante(IN UPcontactoPostulante int, IN UPcomunaResidencia int,
                                                              IN UPdireccionResidencia varchar(200),
                                                              IN UPcorreoContacto varchar(200))
BEGIN
    DECLARE poid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;
    UPDATE contactopostulante
    SET ComunaResidencia=UPcomunaResidencia,
        DireccionResidencia=UPdireccionResidencia,
        CorreoContacto=UPcorreoContacto
    WHERE ContactoPostulanteFK = UPcontactoPostulante;


    COMMIT WORK;

END;

create
    definer = root@`%` procedure editar_UsuarioPostulante(IN UusuarioID int, IN UPnombre varchar(200),
                                                          IN UPapellido varchar(200), IN UPpostulanteID int,
                                                          IN UPgenero varchar(20), IN UPnacionalidad varchar(20),
                                                          IN UPnumDocumento varchar(20), IN UPdocumento varchar(20),
                                                          IN UPfechaNacimiento date, IN UPestadoCivil varchar(20),
                                                          IN UPvehiculoUsuario int, IN UPdiscapacidadUsuario int,
                                                          IN LPtipoA1 int, IN LPtipoA2 int, IN LPtipoA3 int,
                                                          IN LPtipoA4 int, IN LPtipoA5 int, IN LPtipoB int,
                                                          IN LPtipoC int, IN LPtipoD int, IN LPtipoE int,
                                                          IN LPtipoF int, IN LPtipoNo int)
BEGIN
    DECLARE poid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;

    UPDATE usuario SET NombreUsuario=UPnombre, ApellidoUsuario=UPapellido WHERE UsuarioID = UusuarioID;

    UPDATE usuariopostulante
    SET Genero=UPgenero,
        Nacionalidad=UPnacionalidad,
        Documento=UPdocumento,
        NumDocumento=UPnumDocumento,
        FechaNacimiento=UPfechaNacimiento,
        EstadoCivil=UPestadoCivil,
        VehiculoUsuario=UPvehiculoUsuario,
        DiscapacidadUsuario=UPdiscapacidadUsuario
    WHERE usuarioPostulanteID = UPpostulanteID;

    UPDATE licencia
    SET LicenciaTipoA1=LPtipoA1,
        LicenciaTipoA2=LPtipoA2,
        LicenciaTipoA3=LPtipoA3,
        LicenciaTipoA4=LPtipoA4,
        LicenciaTipoA5=LPtipoA5,
        LicenciaTipoB=LPtipoB,
        LicenciaTipoC=LPtipoC,
        LicenciaTipoD=LPtipoD,
        LicenciaTipoE=LPtipoE,
        LicenciaTipoF=LPtipoF,
        Nolicencia=LPtipoNo
    WHERE LicenciaPostulanteFK = UPpostulanteID;

    COMMIT WORK;

END;

create
    definer = root@`%` procedure ingresar_DatosContactoPostulante(IN UPcontactoPostulante int,
                                                                  IN UPcomunaResidencia int,
                                                                  IN UPdireccionResidencia varchar(200),
                                                                  IN UPcorreoContacto varchar(200),
                                                                  IN UPnumeroUsuario int,
                                                                  IN UPcontactoTipo varchar(100),
                                                                  IN UPnumeroTelefonico varchar(50))
BEGIN
    DECLARE poid INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING
        BEGIN
            ROLLBACK;
        END;

    START TRANSACTION;
    INSERT INTO contactopostulante (ContactoPostulanteFK, ComunaResidencia, DireccionResidencia, CorreoContacto)
    VALUES (UPcontactoPostulante, UPcomunaResidencia, UPdireccionResidencia, UPcorreoContacto);

    INSERT INTO numerocontacto (NumeroUsuarioFK, ContactoTipo, NumeroTelefonico)
    VALUES (UPnumeroUsuario, UPcontactoTipo, UPnumeroTelefonico);

    COMMIT WORK;

END;


