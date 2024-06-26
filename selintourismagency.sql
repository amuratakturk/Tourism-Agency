PGDMP                          |            tourismagency    13.15    13.15 '    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24637    tourismagency    DATABASE     k   CREATE DATABASE tourismagency WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_T�rkiye.1254';
    DROP DATABASE tourismagency;
                postgres    false            �            1259    24718    hotel    TABLE     �  CREATE TABLE public.hotel (
    id bigint NOT NULL,
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
       public         heap    postgres    false            �            1259    24724    hotel_id_seq    SEQUENCE     �   ALTER TABLE public.hotel ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 789746567864
    CACHE 1
);
            public          postgres    false    200            �            1259    24726    hotel_pension    TABLE     �   CREATE TABLE public.hotel_pension (
    id bigint NOT NULL,
    hotel_id integer NOT NULL,
    pension_type character varying NOT NULL
);
 !   DROP TABLE public.hotel_pension;
       public         heap    postgres    false            �            1259    24732    hotel_pension_id_seq    SEQUENCE     �   ALTER TABLE public.hotel_pension ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hotel_pension_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �            1259    24734    hotel_season    TABLE     �   CREATE TABLE public.hotel_season (
    id bigint NOT NULL,
    hotel_id integer NOT NULL,
    start_date date NOT NULL,
    finish_date date NOT NULL,
    price_parameter double precision NOT NULL
);
     DROP TABLE public.hotel_season;
       public         heap    postgres    false            �            1259    24737    hotel_season_id_seq    SEQUENCE     �   ALTER TABLE public.hotel_season ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.hotel_season_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �            1259    24739    reservation    TABLE     L  CREATE TABLE public.reservation (
    id bigint NOT NULL,
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
       public         heap    postgres    false            �            1259    24745    reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    206            �            1259    24747    room    TABLE       CREATE TABLE public.room (
    id bigint NOT NULL,
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
       public         heap    postgres    false            �            1259    24753    room_id_seq    SEQUENCE     �   ALTER TABLE public.room ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    208            �            1259    24755    users    TABLE     w   CREATE TABLE public.users (
    user_id bigint NOT NULL,
    user_name text,
    user_pass text,
    user_role text
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24761    user_user_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210            �          0    24718    hotel 
   TABLE DATA           �   COPY public.hotel (id, name, address, city, mail, phone, star, car_park, wifi, pool, fitness, concierge, spa, room_service) FROM stdin;
    public          postgres    false    200   �/       �          0    24726    hotel_pension 
   TABLE DATA           C   COPY public.hotel_pension (id, hotel_id, pension_type) FROM stdin;
    public          postgres    false    202   0       �          0    24734    hotel_season 
   TABLE DATA           ^   COPY public.hotel_season (id, hotel_id, start_date, finish_date, price_parameter) FROM stdin;
    public          postgres    false    204   N0       �          0    24739    reservation 
   TABLE DATA           �   COPY public.reservation (id, room_id, check_in_date, total_price, guest_count, guest_name, guest_citizen_id, guest_mail, guest_phone, check_out_date) FROM stdin;
    public          postgres    false    206   �0       �          0    24747    room 
   TABLE DATA           �   COPY public.room (id, hotel_id, pension_id, season_id, type, stock, adult_price, child_price, bed_capacity, square_meter, television, minibar, game_console, cash_box, projection) FROM stdin;
    public          postgres    false    208   �0       �          0    24755    users 
   TABLE DATA           I   COPY public.users (user_id, user_name, user_pass, user_role) FROM stdin;
    public          postgres    false    210   �0       �           0    0    hotel_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hotel_id_seq', 14, true);
          public          postgres    false    201            �           0    0    hotel_pension_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.hotel_pension_id_seq', 36, true);
          public          postgres    false    203            �           0    0    hotel_season_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotel_season_id_seq', 49, true);
          public          postgres    false    205            �           0    0    reservation_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reservation_id_seq', 23, true);
          public          postgres    false    207            �           0    0    room_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.room_id_seq', 52, true);
          public          postgres    false    209            �           0    0    user_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_user_id_seq', 46, true);
          public          postgres    false    211            H           2606    24764     hotel_pension hotel_pension_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hotel_pension
    ADD CONSTRAINT hotel_pension_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.hotel_pension DROP CONSTRAINT hotel_pension_pkey;
       public            postgres    false    202            F           2606    24766    hotel hotel_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.hotel DROP CONSTRAINT hotel_pkey;
       public            postgres    false    200            J           2606    24768    hotel_season hotel_season_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hotel_season
    ADD CONSTRAINT hotel_season_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.hotel_season DROP CONSTRAINT hotel_season_pkey;
       public            postgres    false    204            L           2606    24770    reservation reservation_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.reservation DROP CONSTRAINT reservation_pkey;
       public            postgres    false    206            N           2606    24772    room room_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.room DROP CONSTRAINT room_pkey;
       public            postgres    false    208            P           2606    24774    users user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    210            Q           2606    24775    hotel_pension fk_hotel_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_pension
    ADD CONSTRAINT fk_hotel_id FOREIGN KEY (hotel_id) REFERENCES public.hotel(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.hotel_pension DROP CONSTRAINT fk_hotel_id;
       public          postgres    false    2886    202    200            R           2606    24780    hotel_season fk_hotel_id2    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_season
    ADD CONSTRAINT fk_hotel_id2 FOREIGN KEY (hotel_id) REFERENCES public.hotel(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.hotel_season DROP CONSTRAINT fk_hotel_id2;
       public          postgres    false    204    2886    200            S           2606    24785    room fk_hotel_id3    FK CONSTRAINT     �   ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_hotel_id3 FOREIGN KEY (hotel_id) REFERENCES public.hotel(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.room DROP CONSTRAINT fk_hotel_id3;
       public          postgres    false    200    2886    208            T           2606    24790    room fk_pension_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_pension_id FOREIGN KEY (pension_id) REFERENCES public.hotel_pension(id) ON DELETE CASCADE;
 <   ALTER TABLE ONLY public.room DROP CONSTRAINT fk_pension_id;
       public          postgres    false    2888    202    208            U           2606    24795    room fk_season_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_season_id FOREIGN KEY (season_id) REFERENCES public.hotel_season(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.room DROP CONSTRAINT fk_season_id;
       public          postgres    false    204    2890    208            �   E   x�34����)���tJ�>��(��JN��ļ���̼�|���^I����sj� g	2����� *��      �   &   x�36�44��V�		rTp��������s����� a�2      �   0   x�3��44�4202�50�50�0�t�9�L,���YS�l� jU
�      �      x������ � �      �      x������ � �      �   F   x�31�,N����442�LL����21��-�H��MM���462�L�-�ɯLM�21�,NLK+���qqq ��     