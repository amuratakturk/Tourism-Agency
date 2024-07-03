PGDMP  ;    4                |            tourismagencylastpatika    14.12    16.3 $                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    24735    tourismagencylastpatika    DATABASE     �   CREATE DATABASE tourismagencylastpatika WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_T�rkiye.1254';
 '   DROP DATABASE tourismagencylastpatika;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            $           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    24741    hotel_id_seq    SEQUENCE        CREATE SEQUENCE public.hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 789746567864
    CACHE 1;
 #   DROP SEQUENCE public.hotel_id_seq;
       public          postgres    false    4            �            1259    24736    hotel    TABLE     �  CREATE TABLE public.hotel (
    id bigint DEFAULT nextval('public.hotel_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    address character varying NOT NULL,
    city character varying(255) NOT NULL,
    mail character varying NOT NULL,
    phone character varying NOT NULL,
    star character varying,
    car_park boolean,
    wifi boolean,
    pool boolean,
    fitness boolean,
    concierge boolean,
    spa boolean,
    room_service boolean
);
    DROP TABLE public.hotel;
       public         heap    postgres    false    210    4            �            1259    24748    hotel_pension_id_seq    SEQUENCE     }   CREATE SEQUENCE public.hotel_pension_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.hotel_pension_id_seq;
       public          postgres    false    4            �            1259    24743    hotel_pension    TABLE     �   CREATE TABLE public.hotel_pension (
    id bigint DEFAULT nextval('public.hotel_pension_id_seq'::regclass) NOT NULL,
    hotel_id integer NOT NULL,
    pension_type character varying NOT NULL
);
 !   DROP TABLE public.hotel_pension;
       public         heap    postgres    false    212    4            �            1259    24753    hotel_season_id_seq    SEQUENCE     |   CREATE SEQUENCE public.hotel_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.hotel_season_id_seq;
       public          postgres    false    4            �            1259    24750    hotel_season    TABLE        CREATE TABLE public.hotel_season (
    id bigint DEFAULT nextval('public.hotel_season_id_seq'::regclass) NOT NULL,
    hotel_id integer NOT NULL,
    start_date date NOT NULL,
    finish_date date NOT NULL,
    price_parameter double precision NOT NULL
);
     DROP TABLE public.hotel_season;
       public         heap    postgres    false    214    4            �            1259    24760    reservation_id_seq    SEQUENCE     {   CREATE SEQUENCE public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reservation_id_seq;
       public          postgres    false    4            �            1259    24755    reservation    TABLE     �  CREATE TABLE public.reservation (
    id bigint DEFAULT nextval('public.reservation_id_seq'::regclass) NOT NULL,
    room_id integer,
    check_in_date date,
    total_price double precision,
    guest_count integer,
    guest_name character varying,
    guest_citizen_id character varying,
    guest_mail character varying,
    guest_phone character varying,
    check_out_date date
);
    DROP TABLE public.reservation;
       public         heap    postgres    false    216    4            �            1259    24767    room_id_seq    SEQUENCE     t   CREATE SEQUENCE public.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.room_id_seq;
       public          postgres    false    4            �            1259    24762    room    TABLE     D  CREATE TABLE public.room (
    id bigint DEFAULT nextval('public.room_id_seq'::regclass) NOT NULL,
    hotel_id integer NOT NULL,
    pension_id integer NOT NULL,
    season_id integer NOT NULL,
    type character varying NOT NULL,
    stock integer NOT NULL,
    adult_price double precision NOT NULL,
    child_price double precision NOT NULL,
    bed_capacity integer NOT NULL,
    square_meter integer NOT NULL,
    television boolean NOT NULL,
    minibar boolean NOT NULL,
    game_console boolean NOT NULL,
    cash_box boolean NOT NULL,
    projection boolean NOT NULL
);
    DROP TABLE public.room;
       public         heap    postgres    false    218    4            �            1259    24774    user_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    4            �            1259    24769    users    TABLE     �   CREATE TABLE public.users (
    user_id bigint DEFAULT nextval('public.user_user_id_seq'::regclass) NOT NULL,
    user_name text,
    user_pass text,
    user_role text
);
    DROP TABLE public.users;
       public         heap    postgres    false    220    4                      0    24736    hotel 
   TABLE DATA           �   COPY public.hotel (id, name, address, city, mail, phone, star, car_park, wifi, pool, fitness, concierge, spa, room_service) FROM stdin;
    public          postgres    false    209   �*                 0    24743    hotel_pension 
   TABLE DATA           C   COPY public.hotel_pension (id, hotel_id, pension_type) FROM stdin;
    public          postgres    false    211   �-                 0    24750    hotel_season 
   TABLE DATA           ^   COPY public.hotel_season (id, hotel_id, start_date, finish_date, price_parameter) FROM stdin;
    public          postgres    false    213   80                 0    24755    reservation 
   TABLE DATA           �   COPY public.reservation (id, room_id, check_in_date, total_price, guest_count, guest_name, guest_citizen_id, guest_mail, guest_phone, check_out_date) FROM stdin;
    public          postgres    false    215   -1                 0    24762    room 
   TABLE DATA           �   COPY public.room (id, hotel_id, pension_id, season_id, type, stock, adult_price, child_price, bed_capacity, square_meter, television, minibar, game_console, cash_box, projection) FROM stdin;
    public          postgres    false    217   4                 0    24769    users 
   TABLE DATA           I   COPY public.users (user_id, user_name, user_pass, user_role) FROM stdin;
    public          postgres    false    219   �5       %           0    0    hotel_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hotel_id_seq', 24, true);
          public          postgres    false    210            &           0    0    hotel_pension_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.hotel_pension_id_seq', 142, true);
          public          postgres    false    212            '           0    0    hotel_season_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotel_season_id_seq', 67, true);
          public          postgres    false    214            (           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 22, true);
          public          postgres    false    216            )           0    0    room_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.room_id_seq', 23, true);
          public          postgres    false    218            *           0    0    user_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_user_id_seq', 8, true);
          public          postgres    false    220            ~           2606    24779     hotel_pension hotel_pension_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hotel_pension
    ADD CONSTRAINT hotel_pension_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.hotel_pension DROP CONSTRAINT hotel_pension_pkey;
       public            postgres    false    211            |           2606    24787    hotel hotel_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_pkey;
       public            postgres    false    209            �           2606    24777    hotel_season hotel_season_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hotel_season
    ADD CONSTRAINT hotel_season_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.hotel_season DROP CONSTRAINT hotel_season_pkey;
       public            postgres    false    213            �           2606    24781    reservation reservation_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    215            �           2606    24783    room room_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public            postgres    false    217            �           2606    24785    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219               �  x�}UMo�0>��
�w���}$��JjU�I�zq�+v�섕����qܵ\z��揄fx#H�?��OB�.�D�û�8/�hB���d����N%�l&�V�NpN��]%�C`m��A޼Zm�h̄BD	�(yb��Z	5^���8�薲\d��ؽKRn4�]p��<.,D�g��م��)�9a�p�B��+��m
��U{n��;����:���0�a�U�A�{_��S�����F\��4�8�c����av��O�>�$�f	Ew��t��X��+��uf�	�ͥCi�Ԓ���5�I�ܰU�;h�K4�Z����� c�j�8!��&X�[�p�����;
Kj��{BB�{��kx\4ƒc�HLe�����rê���;Ple��&\{�}���q��#��tT��ꂕ�b]�@c����3�p��.�`�(�}��ع�J�L�Z���'o�}֭|/u��Bd��-�ش���G�R)V�w�#~�Hڠ������[BR�n�?IE>t�'��y-_U���`:8\�6����0
��ffc�g~���r+q��EsoF#1�]�L��C"=Si����T0��q��{�z�U�;�+`�*e۹W_gD�jn���j��XD/[��3���?�\Y���ջ��[��3�Xx���T�lV7�}s�Q>j��̯4bfF��eQ9s>A���r�Mۙ_+<mJ{|���	�����YdO�i�Pjv�?3�G���OW�V�
D�Y         \  x���M��0F��)�/��G�w��I0Aݸ�$(
���(�PS2���g�E��ܷ��q:~�����:Pv#��4�\�/��4Pb�F/3Q#�АQ��\l���\j��U\a����.�����5d�H�v~L�6
�}�̏;��6̓Ƽ�N������$Ƿ9Uϼ�Z��/����Ép��|��^O�C$��G�UQau :�Ձ�;���om5�.���r�Kjt�	·4�$�.%�,�L��o��"鴘�5�� C�m�^o�����>d�������zAH;7��nij9ga�R�--Ujk��t�9�qRh>�����vzT��$E�ߘ��h)�\�*�V��o�PhvQI�Ֆ�>��RYAThI�� k�RPYAUh�ٽ;Z(�IYw|�;|P��y�{�>i��de+��#��*�z�V�==' ����5�����O�>�]}� #��V�EG}Uj���o�	�������F���_ǽ*�d$IY�G�T��=�n������
�����`��^�u���PW��m��&p'D����>�H#���"p�DM-7G���[$������N��>�?��M�         �   x�}�Q� D��.툀ѻ���(vڐ�l2N���.*Ԩզ�j��r�%UR�����}��1c:�KPN�;�Ub���qQ����;��r{�i�D�[��A��j`��h�Wj{�k�j2��d�'k�D뻱�-`��i�3��!װ>��Ih��%T"�	�7������`�=18Q	U����7�M�����#�ݩ4'Jx����³!�p���k;}=K)o����         �  x�mU=o�@�y���}Kڔ����C��"K��p$�=��d����������������#II�$�zÛ�4 ,�<n�3%���s�n<���l�v�Hъ3R����Ah�޹u?, �2BK����~��D���<#H�4ʙ�j"�o���	Z������%����f������gϑx#��h�iʨVr��ªcD�_hyH�q^%-��J ���"R5����D)w���?/����(���p�
(��9nQ҂ր���On&0�ˇ4��00�L2$cJ�����|r^)Sa4Yn!K�,K��F��Rw��|-�NH ?��ޮ��7�{o���}Eһ�fB`[dGmt�c"<J�AnHW(��А�Đ��A�
>λ����P��Z���@�Dw��dh7�.�=�م�2JpϮ��;�t�?�2^��{pk��1\¸�c?�c�%�e�o���&ם�j|=__�~��G�p:��=U�O8ɰ��R *j�ѭ'�Ңiv���lp���h M�A|�p��RC�a��`GO��
��֖|QeB��_�� �#q6��f><�jN�����d��p���3Ϙ�<�P�;�[��tY*M\*��f\SI<����p�7.���^V�l��F�<V(6f9"���,�-�/F�D�"�-�b�d�!VB��j��\�/�e��Hv��,��x��'睕9���c�/	�}         h  x�}S�n�0;3_�/,�N������4`
l����8�bMI�6��ߟ/���T�5��YNd䌻�E����Re��N�����SVa;�ɾ��**�)��\@�uN�"3fЪ8�T4���H�*�`"#o3���Z!�bd����hhڃ 2X�%A6��N��(�b��<)i�����Hl��������޻+��ySQ�b5���:ٚkޜ��Ktl����V�l�-�d;����F)13n�Z4�z�1f�V�dݚ�[u��Y�4lC�b�y�"�cM��Y�@�Ǣ�f7����N� g�E��E����K�v���k�Vr��0����?h��a����u��?
�)         0   x�3��--J,�4426�LL����2�t
eC�Rsr�+SS�b���� '�Q     