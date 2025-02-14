PGDMP                   
    {         
   wisewallet    16.0    16.0 :    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    32974 
   wisewallet    DATABASE     �   CREATE DATABASE wisewallet WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE wisewallet;
                postgres    false            �            1259    32975 
   categorias    TABLE     e   CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre text,
    id_usuario integer
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    32980    categorias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categorias_id_seq;
       public          postgres    false    215            2           0    0    categorias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;
          public          postgres    false    216            �            1259    32981    gastos    TABLE     �   CREATE TABLE public.gastos (
    id_gastos integer NOT NULL,
    monto numeric NOT NULL,
    fecha_gastos date NOT NULL,
    id_tarjeta integer NOT NULL,
    id_categoria integer
);
    DROP TABLE public.gastos;
       public         heap    postgres    false            �            1259    32986    gastos_id_gastos_seq    SEQUENCE     �   CREATE SEQUENCE public.gastos_id_gastos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.gastos_id_gastos_seq;
       public          postgres    false    217            3           0    0    gastos_id_gastos_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.gastos_id_gastos_seq OWNED BY public.gastos.id_gastos;
          public          postgres    false    218            �            1259    32987    ingresos    TABLE     �   CREATE TABLE public.ingresos (
    id_ingresos integer NOT NULL,
    monto numeric NOT NULL,
    fecha_ingresos date NOT NULL,
    id_tarjeta integer NOT NULL
);
    DROP TABLE public.ingresos;
       public         heap    postgres    false            �            1259    32992    ingresos_id_ingresos_seq    SEQUENCE     �   CREATE SEQUENCE public.ingresos_id_ingresos_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.ingresos_id_ingresos_seq;
       public          postgres    false    219            4           0    0    ingresos_id_ingresos_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.ingresos_id_ingresos_seq OWNED BY public.ingresos.id_ingresos;
          public          postgres    false    220            �            1259    32993 
   limitgasto    TABLE     g   CREATE TABLE public.limitgasto (
    id integer NOT NULL,
    monto numeric,
    id_tarjeta integer
);
    DROP TABLE public.limitgasto;
       public         heap    postgres    false            �            1259    32998    meta    TABLE     a   CREATE TABLE public.meta (
    id integer NOT NULL,
    monto numeric,
    id_tarjeta integer
);
    DROP TABLE public.meta;
       public         heap    postgres    false            �            1259    33003    reportes    TABLE     �   CREATE TABLE public.reportes (
    id_reportes integer NOT NULL,
    tipo text,
    fecha_reportes date,
    id_tarjeta integer,
    "totalIngresos" numeric,
    "totalGastos" numeric,
    id_categoria integer,
    ahorro integer
);
    DROP TABLE public.reportes;
       public         heap    postgres    false            �            1259    33008    tarjeta    TABLE       CREATE TABLE public.tarjeta (
    id integer NOT NULL,
    "cardType" text NOT NULL,
    cvv integer NOT NULL,
    number text NOT NULL,
    id_usuario integer NOT NULL,
    mm text NOT NULL,
    "savingGoal" integer,
    "spendingLimit" integer,
    yyyy text
);
    DROP TABLE public.tarjeta;
       public         heap    postgres    false            �            1259    33013    tarjeta_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarjeta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tarjeta_id_seq;
       public          postgres    false    224            5           0    0    tarjeta_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tarjeta_id_seq OWNED BY public.tarjeta.id;
          public          postgres    false    225            �            1259    33014    usuario    TABLE     �   CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombres text,
    apellidos text,
    email text,
    contrasenia text,
    username text,
    categories text[]
);
    DROP TABLE public.usuario;
       public         heap    postgres    false            �            1259    33019    usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.usuario_id_seq;
       public          postgres    false    226            6           0    0    usuario_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;
          public          postgres    false    227            p           2604    33020    categorias id    DEFAULT     n   ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);
 <   ALTER TABLE public.categorias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            q           2604    33021    gastos id_gastos    DEFAULT     t   ALTER TABLE ONLY public.gastos ALTER COLUMN id_gastos SET DEFAULT nextval('public.gastos_id_gastos_seq'::regclass);
 ?   ALTER TABLE public.gastos ALTER COLUMN id_gastos DROP DEFAULT;
       public          postgres    false    218    217            r           2604    33022    ingresos id_ingresos    DEFAULT     |   ALTER TABLE ONLY public.ingresos ALTER COLUMN id_ingresos SET DEFAULT nextval('public.ingresos_id_ingresos_seq'::regclass);
 C   ALTER TABLE public.ingresos ALTER COLUMN id_ingresos DROP DEFAULT;
       public          postgres    false    220    219            s           2604    33023 
   tarjeta id    DEFAULT     h   ALTER TABLE ONLY public.tarjeta ALTER COLUMN id SET DEFAULT nextval('public.tarjeta_id_seq'::regclass);
 9   ALTER TABLE public.tarjeta ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            t           2604    33024 
   usuario id    DEFAULT     h   ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);
 9   ALTER TABLE public.usuario ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226                      0    32975 
   categorias 
   TABLE DATA           <   COPY public.categorias (id, nombre, id_usuario) FROM stdin;
    public          postgres    false    215   oA       !          0    32981    gastos 
   TABLE DATA           Z   COPY public.gastos (id_gastos, monto, fecha_gastos, id_tarjeta, id_categoria) FROM stdin;
    public          postgres    false    217   �A       #          0    32987    ingresos 
   TABLE DATA           R   COPY public.ingresos (id_ingresos, monto, fecha_ingresos, id_tarjeta) FROM stdin;
    public          postgres    false    219   )B       %          0    32993 
   limitgasto 
   TABLE DATA           ;   COPY public.limitgasto (id, monto, id_tarjeta) FROM stdin;
    public          postgres    false    221   �B       &          0    32998    meta 
   TABLE DATA           5   COPY public.meta (id, monto, id_tarjeta) FROM stdin;
    public          postgres    false    222   �B       '          0    33003    reportes 
   TABLE DATA           �   COPY public.reportes (id_reportes, tipo, fecha_reportes, id_tarjeta, "totalIngresos", "totalGastos", id_categoria, ahorro) FROM stdin;
    public          postgres    false    223   	C       (          0    33008    tarjeta 
   TABLE DATA           s   COPY public.tarjeta (id, "cardType", cvv, number, id_usuario, mm, "savingGoal", "spendingLimit", yyyy) FROM stdin;
    public          postgres    false    224   �C       *          0    33014    usuario 
   TABLE DATA           c   COPY public.usuario (id, nombres, apellidos, email, contrasenia, username, categories) FROM stdin;
    public          postgres    false    226   �D       7           0    0    categorias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categorias_id_seq', 9, true);
          public          postgres    false    216            8           0    0    gastos_id_gastos_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.gastos_id_gastos_seq', 1, false);
          public          postgres    false    218            9           0    0    ingresos_id_ingresos_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.ingresos_id_ingresos_seq', 1, false);
          public          postgres    false    220            :           0    0    tarjeta_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tarjeta_id_seq', 12, true);
          public          postgres    false    225            ;           0    0    usuario_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.usuario_id_seq', 3, true);
          public          postgres    false    227            ~           2606    33026    meta Meta_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.meta
    ADD CONSTRAINT "Meta_pkey" PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.meta DROP CONSTRAINT "Meta_pkey";
       public            postgres    false    222            v           2606    33028    categorias categorias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    215            x           2606    33030    gastos gastos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.gastos
    ADD CONSTRAINT gastos_pkey PRIMARY KEY (id_gastos);
 <   ALTER TABLE ONLY public.gastos DROP CONSTRAINT gastos_pkey;
       public            postgres    false    217            z           2606    33032    ingresos ingresos_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT ingresos_pkey PRIMARY KEY (id_ingresos);
 @   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT ingresos_pkey;
       public            postgres    false    219            |           2606    33034    limitgasto limitgasto_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.limitgasto
    ADD CONSTRAINT limitgasto_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.limitgasto DROP CONSTRAINT limitgasto_pkey;
       public            postgres    false    221            �           2606    33036    tarjeta number 
   CONSTRAINT     K   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT number UNIQUE (number);
 8   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT number;
       public            postgres    false    224            �           2606    33038    reportes reportes_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT reportes_pkey PRIMARY KEY (id_reportes);
 @   ALTER TABLE ONLY public.reportes DROP CONSTRAINT reportes_pkey;
       public            postgres    false    223            �           2606    33040    tarjeta tarjeta_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT tarjeta_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT tarjeta_pkey;
       public            postgres    false    224            �           2606    33042    usuario usuario_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    226            �           2606    33043    gastos fk_id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.gastos
    ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categorias(id) NOT VALID;
 @   ALTER TABLE ONLY public.gastos DROP CONSTRAINT fk_id_categoria;
       public          postgres    false    217    215    4726            �           2606    33048    reportes fk_id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categorias(id);
 B   ALTER TABLE ONLY public.reportes DROP CONSTRAINT fk_id_categoria;
       public          postgres    false    223    4726    215            �           2606    33053    ingresos fk_id_tarjeta    FK CONSTRAINT     z   ALTER TABLE ONLY public.ingresos
    ADD CONSTRAINT fk_id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES public.tarjeta(id);
 @   ALTER TABLE ONLY public.ingresos DROP CONSTRAINT fk_id_tarjeta;
       public          postgres    false    224    4740    219            �           2606    33058    gastos fk_id_tarjeta    FK CONSTRAINT     x   ALTER TABLE ONLY public.gastos
    ADD CONSTRAINT fk_id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES public.tarjeta(id);
 >   ALTER TABLE ONLY public.gastos DROP CONSTRAINT fk_id_tarjeta;
       public          postgres    false    224    217    4740            �           2606    33063    reportes fk_id_tarjeta    FK CONSTRAINT     z   ALTER TABLE ONLY public.reportes
    ADD CONSTRAINT fk_id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES public.tarjeta(id);
 @   ALTER TABLE ONLY public.reportes DROP CONSTRAINT fk_id_tarjeta;
       public          postgres    false    224    4740    223            �           2606    33068    tarjeta fk_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarjeta
    ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id) NOT VALID;
 ?   ALTER TABLE ONLY public.tarjeta DROP CONSTRAINT fk_id_usuario;
       public          postgres    false    4742    224    226            �           2606    33073    categorias fk_idusuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT fk_idusuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id) NOT VALID;
 A   ALTER TABLE ONLY public.categorias DROP CONSTRAINT fk_idusuario;
       public          postgres    false    215    4742    226            �           2606    33078    meta id_tarjeta    FK CONSTRAINT     }   ALTER TABLE ONLY public.meta
    ADD CONSTRAINT id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES public.tarjeta(id) NOT VALID;
 9   ALTER TABLE ONLY public.meta DROP CONSTRAINT id_tarjeta;
       public          postgres    false    224    4740    222            �           2606    33083    limitgasto id_tarjeta    FK CONSTRAINT     �   ALTER TABLE ONLY public.limitgasto
    ADD CONSTRAINT id_tarjeta FOREIGN KEY (id_tarjeta) REFERENCES public.tarjeta(id) NOT VALID;
 ?   ALTER TABLE ONLY public.limitgasto DROP CONSTRAINT id_tarjeta;
       public          postgres    false    4740    221    224               M   x�3�LN,N�4�2�L��K2�9��	�0��+M-I�q�$r�q�s� ��gbq
���9�9@U�\1z\\\ �      !   M   x�m��	� D��L/��ݨ�D*��:ܓ���_��<��X�0���G��>u gքm246��:�����y�\ܚ      #   g   x�e���@�3Ӌ���i/�_��e���Fw7��Fnތ�b݄ƥ�N�k�*���ԟq	ƿ�X�a��;1��p�L#�q_�0>�"f����(\;�`!.h      %   -   x�3�4500�4�2�41,�L8��B\Ɯ�F�F��\1z\\\ ��&      &      x�3�42 NC.#NC m����� (�+      '   �   x���11��_�:$$=����$��Ԗ+G��F�r���0�.�bB�h�)����u�"�
s�H_�c��Rq��� �Ė�죰�>�Q�!�1�����)L-LC�
%*iяr\ҨF�K��W�S��[h�B�֢��+�| !�}      (   �   x�eP1�0��W��v�Ҏ�0!�.t 	��<;�h���J�\l�C�>]b��V8Q8�p����hKH��D�D~%�v�X��6D��1C���H`�`(T��Q54eT&�\E�SL�~�E��!(ܲ	j��ݣO�K|�߯�����qP��d��L+�Z�u�����-��L�����i��t\<�@j!�k���`�ј�v�n��w[^H      *   E  x�}Q�N�0<o�"`��i���J=��M�*U��HE|����G�,Zz��gv�1���=���[L9H�/w=�ݤ�r^Lgs0ڠj���-)FY�(���
Y���d�8�5��#x���	�Gͤ�W�+hx�%��6�Y+���j��$�Ñşk��o�5�-�V+�![�v���T�ʢ�>��o,y��x�#���ok�#Y��nBS�w9i���ó��^�F;���Y�h���KL���}{W#�g�@;�,��xJZS�@$��e�����<��ϳK��_�؄ʊ@� ��@�{ġG�3n_>���I�$?��     