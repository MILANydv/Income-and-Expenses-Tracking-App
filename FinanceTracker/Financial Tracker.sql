PGDMP                         y            Financial Tracker    13.3    13.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17535    Financial Tracker    DATABASE     w   CREATE DATABASE "Financial Tracker" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.utf8';
 #   DROP DATABASE "Financial Tracker";
                postgres    false            �            1259    17567 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    17565    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    207            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    206            �            1259    17577    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    17575    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    209            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    208            �            1259    17559    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    17557    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    205            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    204            �            1259    17585 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    17595    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    17593    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    213            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    212            �            1259    17583    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    211            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    210            �            1259    17603    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    17601 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    215            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    214            �            1259    17663    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    17661    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    217            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    216            �            1259    17549    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    17547    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    203            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    202            �            1259    17538    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    17536    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    201            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    200            �            1259    17747    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    17696    expenses_category    TABLE     �   CREATE TABLE public.expenses_category (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    notes text NOT NULL
);
 %   DROP TABLE public.expenses_category;
       public         heap    postgres    false            �            1259    17694    expenses_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expenses_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.expenses_category_id_seq;
       public          postgres    false    219            �           0    0    expenses_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.expenses_category_id_seq OWNED BY public.expenses_category.id;
          public          postgres    false    218            �            1259    17707    expenses_expense    TABLE     �   CREATE TABLE public.expenses_expense (
    id integer NOT NULL,
    category character varying(255) NOT NULL,
    description text NOT NULL,
    amount double precision NOT NULL,
    date date NOT NULL,
    owner_id integer NOT NULL
);
 $   DROP TABLE public.expenses_expense;
       public         heap    postgres    false            �            1259    17705    expenses_expense_id_seq    SEQUENCE     �   CREATE SEQUENCE public.expenses_expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.expenses_expense_id_seq;
       public          postgres    false    221            �           0    0    expenses_expense_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.expenses_expense_id_seq OWNED BY public.expenses_expense.id;
          public          postgres    false    220            �            1259    17732    income_income    TABLE     �   CREATE TABLE public.income_income (
    id integer NOT NULL,
    source character varying(255) NOT NULL,
    description text NOT NULL,
    amount double precision NOT NULL,
    date date NOT NULL,
    owner_id integer NOT NULL
);
 !   DROP TABLE public.income_income;
       public         heap    postgres    false            �            1259    17730    income_income_id_seq    SEQUENCE     �   CREATE SEQUENCE public.income_income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.income_income_id_seq;
       public          postgres    false    225            �           0    0    income_income_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.income_income_id_seq OWNED BY public.income_income.id;
          public          postgres    false    224            �            1259    17724    income_source    TABLE     i   CREATE TABLE public.income_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);
 !   DROP TABLE public.income_source;
       public         heap    postgres    false            �            1259    17722    income_source_id_seq    SEQUENCE     �   CREATE SEQUENCE public.income_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.income_source_id_seq;
       public          postgres    false    223            �           0    0    income_source_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.income_source_id_seq OWNED BY public.income_source.id;
          public          postgres    false    222            �            1259    17769    usersettings_profile    TABLE     I  CREATE TABLE public.usersettings_profile (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(10) NOT NULL,
    country character varying(50) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL,
    address1 character varying(50) NOT NULL,
    address2 character varying(50) NOT NULL,
    zip character varying(50) NOT NULL,
    profile_pic character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);
 (   DROP TABLE public.usersettings_profile;
       public         heap    postgres    false            �            1259    17767    usersettings_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usersettings_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.usersettings_profile_id_seq;
       public          postgres    false    230            �           0    0    usersettings_profile_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.usersettings_profile_id_seq OWNED BY public.usersettings_profile.id;
          public          postgres    false    229            �            1259    17759    usersettings_usersetting    TABLE     �   CREATE TABLE public.usersettings_usersetting (
    id integer NOT NULL,
    currency character varying(255) NOT NULL,
    user_id integer NOT NULL
);
 ,   DROP TABLE public.usersettings_usersetting;
       public         heap    postgres    false            �            1259    17757    usersettings_usersetting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usersettings_usersetting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.usersettings_usersetting_id_seq;
       public          postgres    false    228            �           0    0    usersettings_usersetting_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.usersettings_usersetting_id_seq OWNED BY public.usersettings_usersetting.id;
          public          postgres    false    227            �           2604    17570    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    17580    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    17562    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    17588    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    17598    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    17606    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    17666    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    17552    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    17541    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            �           2604    17699    expenses_category id    DEFAULT     |   ALTER TABLE ONLY public.expenses_category ALTER COLUMN id SET DEFAULT nextval('public.expenses_category_id_seq'::regclass);
 C   ALTER TABLE public.expenses_category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    17710    expenses_expense id    DEFAULT     z   ALTER TABLE ONLY public.expenses_expense ALTER COLUMN id SET DEFAULT nextval('public.expenses_expense_id_seq'::regclass);
 B   ALTER TABLE public.expenses_expense ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    17735    income_income id    DEFAULT     t   ALTER TABLE ONLY public.income_income ALTER COLUMN id SET DEFAULT nextval('public.income_income_id_seq'::regclass);
 ?   ALTER TABLE public.income_income ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    17727    income_source id    DEFAULT     t   ALTER TABLE ONLY public.income_source ALTER COLUMN id SET DEFAULT nextval('public.income_source_id_seq'::regclass);
 ?   ALTER TABLE public.income_source ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    17772    usersettings_profile id    DEFAULT     �   ALTER TABLE ONLY public.usersettings_profile ALTER COLUMN id SET DEFAULT nextval('public.usersettings_profile_id_seq'::regclass);
 F   ALTER TABLE public.usersettings_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    17762    usersettings_usersetting id    DEFAULT     �   ALTER TABLE ONLY public.usersettings_usersetting ALTER COLUMN id SET DEFAULT nextval('public.usersettings_usersetting_id_seq'::regclass);
 J   ALTER TABLE public.usersettings_usersetting ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            i          0    17567 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    207   ��       k          0    17577    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    209   �       g          0    17559    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    205   �       m          0    17585 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    211   �       o          0    17595    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    213   ��       q          0    17603    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    215   ��       s          0    17663    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    217   ��       e          0    17549    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    203   ��       c          0    17538    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201   {�       |          0    17747    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    226   t�       u          0    17696    expenses_category 
   TABLE DATA           <   COPY public.expenses_category (id, name, notes) FROM stdin;
    public          postgres    false    219   S�       w          0    17707    expenses_expense 
   TABLE DATA           ]   COPY public.expenses_expense (id, category, description, amount, date, owner_id) FROM stdin;
    public          postgres    false    221   |�       {          0    17732    income_income 
   TABLE DATA           X   COPY public.income_income (id, source, description, amount, date, owner_id) FROM stdin;
    public          postgres    false    225   ?�       y          0    17724    income_source 
   TABLE DATA           1   COPY public.income_source (id, name) FROM stdin;
    public          postgres    false    223   \�       �          0    17769    usersettings_profile 
   TABLE DATA           �   COPY public.usersettings_profile (id, name, email, phone, country, city, state, address1, address2, zip, profile_pic, created_date, user_id) FROM stdin;
    public          postgres    false    230   y�       ~          0    17759    usersettings_usersetting 
   TABLE DATA           I   COPY public.usersettings_usersetting (id, currency, user_id) FROM stdin;
    public          postgres    false    228   P�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    206            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    208            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
          public          postgres    false    204            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    212            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);
          public          postgres    false    210            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    214            �           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);
          public          postgres    false    216            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);
          public          postgres    false    202            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);
          public          postgres    false    200            �           0    0    expenses_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.expenses_category_id_seq', 1, true);
          public          postgres    false    218            �           0    0    expenses_expense_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.expenses_expense_id_seq', 13, true);
          public          postgres    false    220            �           0    0    income_income_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.income_income_id_seq', 1, false);
          public          postgres    false    224            �           0    0    income_source_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.income_source_id_seq', 1, false);
          public          postgres    false    222            �           0    0    usersettings_profile_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.usersettings_profile_id_seq', 4, true);
          public          postgres    false    229            �           0    0    usersettings_usersetting_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.usersettings_usersetting_id_seq', 3, true);
          public          postgres    false    227            �           2606    17692    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    207            �           2606    17619 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    209    209            �           2606    17582 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    209            �           2606    17572    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    207            �           2606    17610 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    205    205            �           2606    17564 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    205            �           2606    17600 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    213            �           2606    17634 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    213    213            �           2606    17590    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    211            �           2606    17608 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    215            �           2606    17648 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    215    215            �           2606    17686     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    211            �           2606    17672 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    217            �           2606    17556 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    203    203            �           2606    17554 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    203            �           2606    17546 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    201            �           2606    17754 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    226            �           2606    17704 (   expenses_category expenses_category_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.expenses_category
    ADD CONSTRAINT expenses_category_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.expenses_category DROP CONSTRAINT expenses_category_pkey;
       public            postgres    false    219            �           2606    17715 &   expenses_expense expenses_expense_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_pkey;
       public            postgres    false    221            �           2606    17740     income_income income_income_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.income_income
    ADD CONSTRAINT income_income_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.income_income DROP CONSTRAINT income_income_pkey;
       public            postgres    false    225            �           2606    17729     income_source income_source_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.income_source
    ADD CONSTRAINT income_source_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.income_source DROP CONSTRAINT income_source_pkey;
       public            postgres    false    223            �           2606    17777 .   usersettings_profile usersettings_profile_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.usersettings_profile
    ADD CONSTRAINT usersettings_profile_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.usersettings_profile DROP CONSTRAINT usersettings_profile_pkey;
       public            postgres    false    230            �           2606    17779 5   usersettings_profile usersettings_profile_user_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.usersettings_profile
    ADD CONSTRAINT usersettings_profile_user_id_key UNIQUE (user_id);
 _   ALTER TABLE ONLY public.usersettings_profile DROP CONSTRAINT usersettings_profile_user_id_key;
       public            postgres    false    230            �           2606    17764 6   usersettings_usersetting usersettings_usersetting_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.usersettings_usersetting
    ADD CONSTRAINT usersettings_usersetting_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.usersettings_usersetting DROP CONSTRAINT usersettings_usersetting_pkey;
       public            postgres    false    228            �           2606    17766 =   usersettings_usersetting usersettings_usersetting_user_id_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.usersettings_usersetting
    ADD CONSTRAINT usersettings_usersetting_user_id_key UNIQUE (user_id);
 g   ALTER TABLE ONLY public.usersettings_usersetting DROP CONSTRAINT usersettings_usersetting_user_id_key;
       public            postgres    false    228            �           1259    17693    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    207            �           1259    17630 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    209            �           1259    17631 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    209            �           1259    17616 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    205            �           1259    17646 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    213            �           1259    17645 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    213            �           1259    17660 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    215            �           1259    17659 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    215            �           1259    17687     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    211            �           1259    17683 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    217            �           1259    17684 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    217            �           1259    17756 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    226            �           1259    17755 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    226            �           1259    17721 "   expenses_expense_owner_id_7e7f594e    INDEX     c   CREATE INDEX expenses_expense_owner_id_7e7f594e ON public.expenses_expense USING btree (owner_id);
 6   DROP INDEX public.expenses_expense_owner_id_7e7f594e;
       public            postgres    false    221            �           1259    17746    income_income_owner_id_f6d945e8    INDEX     ]   CREATE INDEX income_income_owner_id_f6d945e8 ON public.income_income USING btree (owner_id);
 3   DROP INDEX public.income_income_owner_id_f6d945e8;
       public            postgres    false    225            �           2606    17625 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    205    2972    209            �           2606    17620 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    2977    209    207            �           2606    17611 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    203    2967    205            �           2606    17640 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    213    207    2977            �           2606    17635 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    211    213    2985            �           2606    17654 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    2972    215    205            �           2606    17649 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    215    211    2985            �           2606    17673 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    217    203    2967            �           2606    17678 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    211    217    2985            �           2606    17716 C   expenses_expense expenses_expense_owner_id_7e7f594e_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.expenses_expense
    ADD CONSTRAINT expenses_expense_owner_id_7e7f594e_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.expenses_expense DROP CONSTRAINT expenses_expense_owner_id_7e7f594e_fk_auth_user_id;
       public          postgres    false    2985    211    221            �           2606    17741 =   income_income income_income_owner_id_f6d945e8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.income_income
    ADD CONSTRAINT income_income_owner_id_f6d945e8_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.income_income DROP CONSTRAINT income_income_owner_id_f6d945e8_fk_auth_user_id;
       public          postgres    false    211    225    2985            �           2606    17785 J   usersettings_profile usersettings_profile_user_id_cdf1a483_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.usersettings_profile
    ADD CONSTRAINT usersettings_profile_user_id_cdf1a483_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.usersettings_profile DROP CONSTRAINT usersettings_profile_user_id_cdf1a483_fk_auth_user_id;
       public          postgres    false    211    230    2985            �           2606    17780 R   usersettings_usersetting usersettings_usersetting_user_id_801f3166_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.usersettings_usersetting
    ADD CONSTRAINT usersettings_usersetting_user_id_801f3166_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.usersettings_usersetting DROP CONSTRAINT usersettings_usersetting_user_id_801f3166_fk_auth_user_id;
       public          postgres    false    211    228    2985            i      x������ � �      k      x������ � �      g   �  x�]�[n�0E��U��*���6*U��)�8m���x<�� �����{��v��q�|H��8�Ο���鿻0xE�% o����-�?��Uض�Б�&??�ec05��=I9��`��O�((�+*w%�a���4 ���\�G/D�t*� R�J��2x.~6-l�ֵ�|���3p��#��g��g�6�7�trCZo�J�ɛ#�Ҷb�E��`R�Uz�x��|}`���ud��|�'���*�̠'a*팡a"��!���K~��᜿!��V1T�x���|5E��?A�n�7��xs1�l��j�R�J&��(�i_�s�˃�6*�D��CH���rq����N����f��o*y���<#�R(�t�P�V��)�S-�F-�1�9�\�m�oI�z��}K�D]��n�S},z~�_�}�m��y���x�J�N�;s��'������|�Yk�9�e�      m   y  x�u�]O�P@��W�зFv�'���d�V��[cb(-A�-���kltݸ�y�d��sf��.�e�6y�`:�^]�]@��{�5E��y�g-)D���>nw]8bq�F	���i��ˣ�|��N@�`�Q�QHڔQ�!0E��WE�<���o���N��N�Zw�#�0V)BlB	a�}�I��ߦQp�����Kr�^��5~��0X�������k�� 3<*�~U]�����n���\��/- �u:6��_��0 ��@X�*�� l�Hbz4��d�_���=�7mM�ː����1ޖ^3��Ouq��4��p5���
�c7�����E�O EA�)��Z��e^W�ޚI���}8=�˼�M�|-_��      o      x������ � �      q      x������ � �      s   �   x���=k�0���Fkqw����ҵ�5�`b��G�ݡ����^Ҋ-��E����0# ܀ݠ.H8����R�PN������yl�l��7_3W��!���e�U��m��*4Kx:���r�t���0��y���ﮮ?��-Ӓ_�i5��_��.�]��QNQa�kd��/��-"[��scQhL�el�b�Am�m��8e���R�j�m
 ��Pqi���}�ؖN^�(!y'���+�I(+�?����<Ͽ �!�y      e   �   x�U���0���� :�߅�4B��%U�J��p�?;���!	�Y��h�����eHfI�ŉEk�~�j\p�Nŧ����p$�m�����Y���:G���_�#p�$�L��t��]�� �y��=I�_@h��\��z�u��Qh      c   �  x���͎� ���S�}5���YVB(a<H��`<J�~qƐh�+����� �s�R��nj!`����]���7�O�O\%��o�O���s��)N-"��K�}�V�IXU�BӅ6;�7]���.����F	2����&K�='���֜?�?�46q�Fي?���i�0ˎl�i
E��'�%��b�i1� Lo��sC��ڤi�I�YU]i��[�� ��bKW{-��T�vT�$�b� ����씖��yĹ�jB	�T��a�>ִ��`� �9@��y�W���l�/6�8�+�b��n�l��6�ҒTg��fR;�#C)�=Va�G^/�$���x�Yim��I#�7D%����3c��SY���@8�RA-;��x�>�8��+Up�q�������0^�э�!��]� E9l$M�����JNA���YF�\J~h_P��	Z��C���"%�A��W'
G*��x8���      |   �  x���Yr�H��g{~�����x�B #1EG��<$b��r���{�����/�c��L��ժ�j�Snj�&�����4�����TԮԮ��?�	��x<�"�< ��M9]L8i��*K�X/
_:f�B�f�K��*PI7|��k�]u%tL��ͺvHQT��!WoyM׊z2��~�i�!��+pk�@����G�d���љR(�Ҍ"S��16�A���T�m�bn[D��c�=�Hdd��$~A A

2o 
 ~gǮ�� �:��y����R�j���K��z?������Ҥ��Iŵ�4tv��k�W�UW�VV><gW�:�#��MC������-��hl擢��i��,�ƆY+�w=ܺw����'Nӎ/�޹��V���rJ�G-�ws�T=�־�|��ﺺ�cj���ay>�y�u�åU�5՚%m�L[+.Ӳ��.��m-���'��>io�"�B��J����b��$�\�����H��G"�gwˆڿ��y�� Y�w�x��_��墈��0�p���@�ɻ8Z�i���n/q&׋s�\Z���g*p��d�Cn<�	(�S�J���T\4��x������iq�*S}jΥ�0���y�'�j9r=�ˌ������z����V}��xP�x�^%�]�#i��M���U��l��|)����TT�U-/��7��Ps�Y�Y;K�u&������V��̱����,�2�$�xy��x���6�Ju.�Mz2}��gY���e+���*f����c�)��[�7�� �s�_H���{��I����Ӕ�-��.o��%�����X����2i��}n�����5�Dw���]����C����{��h^��;�1�~7���'
��h�)�P�gnY<�l�2N�y�P��2;,U�^��UlQJ+���N��h0^г$O�S��'
~*!����~}}��z      u      x�3�L��O�LNLK����� *�-      w   �   x�]�Q� @��]\(�]��2\�l&��y��Bt�4��{�M�4yN���GEa%m��P��yƮBZ�ǒJ(�Dg|`~�ejv��'l��_���ߒ�$�}yQĭC1�MF7��e~�$�~�'	M���()�k\�6�9�o�~���ٺ.p>��c(��,��=ok,o��'!��Q]�      {      x������ � �      y      x������ � �      �   �   x�]��j1E�/_1�b��K�IVխ�{�Pf#Iƌ�߷�Z�wu/�Ź�T�q����T?�K?ɱ��ƅrl�=�'�dV�r/�zc�����4;|�[����9&�?gp]KʢS���l�3�0Æ��a]8x���1�R�q:b�F���b�ym�E����ia���xנ�<vR9��qR���D�      ~   0   x�3��R�U�K-H�I-NU*-HM�4�2�.a�e�]+F��� �n*     