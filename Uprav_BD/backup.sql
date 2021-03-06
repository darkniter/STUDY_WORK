PGDMP         $                 x         	   darkniter %   10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)    12.0 J    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16386 	   darkniter    DATABASE     {   CREATE DATABASE darkniter WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';
    DROP DATABASE darkniter;
                postgres    false            �            1259    16486    Accounts    TABLE     m   CREATE TABLE public."Accounts" (
    id integer NOT NULL,
    login text NOT NULL,
    pass text NOT NULL
);
    DROP TABLE public."Accounts";
       public         	   darkniter    false            �            1259    16627    Accounts_id_seq    SEQUENCE     �   ALTER TABLE public."Accounts" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Accounts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    204            �            1259    16469    Connection_Data    TABLE     �   CREATE TABLE public."Connection_Data" (
    id integer NOT NULL,
    "time" date NOT NULL,
    "Account" text NOT NULL,
    device text NOT NULL
);
 %   DROP TABLE public."Connection_Data";
       public         	   darkniter    false            �            1259    16671    Connection_Data_id_seq    SEQUENCE     �   ALTER TABLE public."Connection_Data" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Connection_Data_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    202            �            1259    16502    Department_Management    TABLE     c   CREATE TABLE public."Department_Management" (
    id integer NOT NULL,
    "Name" text NOT NULL
);
 +   DROP TABLE public."Department_Management";
       public         	   darkniter    false            �            1259    16631    Department_Management_id_seq    SEQUENCE     �   ALTER TABLE public."Department_Management" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Department_Management_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    206            �            1259    16429 	   Divisions    TABLE     n   CREATE TABLE public."Divisions" (
    id integer NOT NULL,
    "Name" text NOT NULL,
    "Manager" integer
);
    DROP TABLE public."Divisions";
       public         	   darkniter    false            �           0    0    TABLE "Divisions"    ACL     }   REVOKE ALL ON TABLE public."Divisions" FROM darkniter;
GRANT ALL ON TABLE public."Divisions" TO darkniter WITH GRANT OPTION;
          public       	   darkniter    false    198            �            1259    16477 	   Equipment    TABLE        CREATE TABLE public."Equipment" (
    id integer NOT NULL,
    device_name text NOT NULL,
    ports smallint,
    node text
);
    DROP TABLE public."Equipment";
       public         	   darkniter    false            �            1259    16640    Equipment_id_seq    SEQUENCE     �   ALTER TABLE public."Equipment" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Equipment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    203            �            1259    16494    Node_switches    TABLE     [   CREATE TABLE public."Node_switches" (
    id integer NOT NULL,
    "Name" text NOT NULL
);
 #   DROP TABLE public."Node_switches";
       public         	   darkniter    false            �            1259    16629    Node_switches_id_seq    SEQUENCE     �   ALTER TABLE public."Node_switches" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Node_switches_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    205            �            1259    16407    Posts    TABLE     s   CREATE TABLE public."Posts" (
    id integer NOT NULL,
    "Name" text NOT NULL,
    "Payment" integer NOT NULL
);
    DROP TABLE public."Posts";
       public         	   darkniter    false            �            1259    16445    Staff    TABLE     �   CREATE TABLE public."Staff" (
    id integer NOT NULL,
    "Name" text NOT NULL,
    "Post" text,
    "Division" text,
    "Management" text
);
    DROP TABLE public."Staff";
       public         	   darkniter    false            �            1259    16642    Staff_id_seq    SEQUENCE     �   ALTER TABLE public."Staff" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Staff_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    199            �            1259    16461    Tariffs    TABLE     j   CREATE TABLE public."Tariffs" (
    "NAME_G" text NOT NULL,
    price integer,
    id integer NOT NULL
);
    DROP TABLE public."Tariffs";
       public         	   darkniter    false            �            1259    16621    Tariffs_id_seq    SEQUENCE     �   ALTER TABLE public."Tariffs" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Tariffs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    201            �            1259    16453    Users    TABLE     �   CREATE TABLE public."Users" (
    id integer NOT NULL,
    "Name" text NOT NULL,
    "Account" text NOT NULL,
    "Tariff" text
);
    DROP TABLE public."Users";
       public         	   darkniter    false            �            1259    16638    Users_id_seq    SEQUENCE     �   ALTER TABLE public."Users" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    200            �            1259    16410    Должности_id_seq    SEQUENCE     �   ALTER TABLE public."Posts" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Должности_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       	   darkniter    false    196            �          0    16486    Accounts 
   TABLE DATA           5   COPY public."Accounts" (id, login, pass) FROM stdin;
    public       	   darkniter    false    204   U       �          0    16469    Connection_Data 
   TABLE DATA           J   COPY public."Connection_Data" (id, "time", "Account", device) FROM stdin;
    public       	   darkniter    false    202   �U       �          0    16502    Department_Management 
   TABLE DATA           =   COPY public."Department_Management" (id, "Name") FROM stdin;
    public       	   darkniter    false    206   RV       �          0    16429 	   Divisions 
   TABLE DATA           <   COPY public."Divisions" (id, "Name", "Manager") FROM stdin;
    public       	   darkniter    false    198   �V       �          0    16477 	   Equipment 
   TABLE DATA           C   COPY public."Equipment" (id, device_name, ports, node) FROM stdin;
    public       	   darkniter    false    203   >W       �          0    16494    Node_switches 
   TABLE DATA           5   COPY public."Node_switches" (id, "Name") FROM stdin;
    public       	   darkniter    false    205   �W       �          0    16407    Posts 
   TABLE DATA           8   COPY public."Posts" (id, "Name", "Payment") FROM stdin;
    public       	   darkniter    false    196   )X       �          0    16445    Staff 
   TABLE DATA           O   COPY public."Staff" (id, "Name", "Post", "Division", "Management") FROM stdin;
    public       	   darkniter    false    199   �X       �          0    16461    Tariffs 
   TABLE DATA           8   COPY public."Tariffs" ("NAME_G", price, id) FROM stdin;
    public       	   darkniter    false    201   RY       �          0    16453    Users 
   TABLE DATA           B   COPY public."Users" (id, "Name", "Account", "Tariff") FROM stdin;
    public       	   darkniter    false    200   �Y       �           0    0    Accounts_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Accounts_id_seq"', 7, true);
          public       	   darkniter    false    208            �           0    0    Connection_Data_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Connection_Data_id_seq"', 13, true);
          public       	   darkniter    false    214            �           0    0    Department_Management_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."Department_Management_id_seq"', 5, true);
          public       	   darkniter    false    210            �           0    0    Equipment_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Equipment_id_seq"', 7, true);
          public       	   darkniter    false    212            �           0    0    Node_switches_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Node_switches_id_seq"', 6, true);
          public       	   darkniter    false    209            �           0    0    Staff_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Staff_id_seq"', 5, true);
          public       	   darkniter    false    213            �           0    0    Tariffs_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Tariffs_id_seq"', 6, true);
          public       	   darkniter    false    207            �           0    0    Users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Users_id_seq"', 5, true);
          public       	   darkniter    false    211            �           0    0    Должности_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Должности_id_seq"', 5, true);
          public       	   darkniter    false    197                       2606    16542    Accounts Acc_Name 
   CONSTRAINT     Q   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Acc_Name" UNIQUE (login);
 ?   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Acc_Name";
       public         	   darkniter    false    204                       2606    16540    Accounts Account_ID 
   CONSTRAINT     P   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Account_ID" UNIQUE (id);
 A   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Account_ID";
       public         	   darkniter    false    204                       2606    16493    Accounts Accounts_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Accounts"
    ADD CONSTRAINT "Accounts_pkey" PRIMARY KEY (id, login);
 D   ALTER TABLE ONLY public."Accounts" DROP CONSTRAINT "Accounts_pkey";
       public         	   darkniter    false    204    204                       2606    16476 $   Connection_Data Connection_Data_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Connection_Data"
    ADD CONSTRAINT "Connection_Data_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Connection_Data" DROP CONSTRAINT "Connection_Data_pkey";
       public         	   darkniter    false    202                       2606    16538    Node_switches D_ID 
   CONSTRAINT     O   ALTER TABLE ONLY public."Node_switches"
    ADD CONSTRAINT "D_ID" UNIQUE (id);
 @   ALTER TABLE ONLY public."Node_switches" DROP CONSTRAINT "D_ID";
       public         	   darkniter    false    205            #           2606    16509 0   Department_Management Department_Management_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."Department_Management"
    ADD CONSTRAINT "Department_Management_pkey" PRIMARY KEY (id, "Name");
 ^   ALTER TABLE ONLY public."Department_Management" DROP CONSTRAINT "Department_Management_pkey";
       public         	   darkniter    false    206    206                       2606    16536    Node_switches Device 
   CONSTRAINT     U   ALTER TABLE ONLY public."Node_switches"
    ADD CONSTRAINT "Device" UNIQUE ("Name");
 B   ALTER TABLE ONLY public."Node_switches" DROP CONSTRAINT "Device";
       public         	   darkniter    false    205                       2606    16600    Equipment Device_model 
   CONSTRAINT     \   ALTER TABLE ONLY public."Equipment"
    ADD CONSTRAINT "Device_model" UNIQUE (device_name);
 D   ALTER TABLE ONLY public."Equipment" DROP CONSTRAINT "Device_model";
       public         	   darkniter    false    203                       2606    16556    Divisions Div_Id 
   CONSTRAINT     M   ALTER TABLE ONLY public."Divisions"
    ADD CONSTRAINT "Div_Id" UNIQUE (id);
 >   ALTER TABLE ONLY public."Divisions" DROP CONSTRAINT "Div_Id";
       public         	   darkniter    false    198                       2606    16554    Divisions Div_Prim 
   CONSTRAINT     \   ALTER TABLE ONLY public."Divisions"
    ADD CONSTRAINT "Div_Prim" PRIMARY KEY ("Name", id);
 @   ALTER TABLE ONLY public."Divisions" DROP CONSTRAINT "Div_Prim";
       public         	   darkniter    false    198    198                       2606    16558    Divisions Div_name 
   CONSTRAINT     S   ALTER TABLE ONLY public."Divisions"
    ADD CONSTRAINT "Div_name" UNIQUE ("Name");
 @   ALTER TABLE ONLY public."Divisions" DROP CONSTRAINT "Div_name";
       public         	   darkniter    false    198                       2606    16484    Equipment Equipment_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public."Equipment"
    ADD CONSTRAINT "Equipment_pkey" PRIMARY KEY (id, device_name);
 F   ALTER TABLE ONLY public."Equipment" DROP CONSTRAINT "Equipment_pkey";
       public         	   darkniter    false    203    203                       2606    16452    Staff Id 
   CONSTRAINT     J   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Id" PRIMARY KEY (id);
 6   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Id";
       public         	   darkniter    false    199            %           2606    16550     Department_Management Manager_id 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Department_Management"
    ADD CONSTRAINT "Manager_id" UNIQUE (id);
 N   ALTER TABLE ONLY public."Department_Management" DROP CONSTRAINT "Manager_id";
       public         	   darkniter    false    206            '           2606    16552 "   Department_Management Manager_name 
   CONSTRAINT     c   ALTER TABLE ONLY public."Department_Management"
    ADD CONSTRAINT "Manager_name" UNIQUE ("Name");
 P   ALTER TABLE ONLY public."Department_Management" DROP CONSTRAINT "Manager_name";
       public         	   darkniter    false    206            !           2606    16501     Node_switches Node_switches_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Node_switches"
    ADD CONSTRAINT "Node_switches_pkey" PRIMARY KEY (id, "Name");
 N   ALTER TABLE ONLY public."Node_switches" DROP CONSTRAINT "Node_switches_pkey";
       public         	   darkniter    false    205    205            �
           2606    16511 
   Posts Post 
   CONSTRAINT     T   ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Post" PRIMARY KEY (id, "Name");
 8   ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "Post";
       public         	   darkniter    false    196    196            �
           2606    16529    Posts Post_name 
   CONSTRAINT     P   ALTER TABLE ONLY public."Posts"
    ADD CONSTRAINT "Post_name" UNIQUE ("Name");
 =   ALTER TABLE ONLY public."Posts" DROP CONSTRAINT "Post_name";
       public         	   darkniter    false    196                       2606    16548    Tariffs Tar_Group 
   CONSTRAINT     T   ALTER TABLE ONLY public."Tariffs"
    ADD CONSTRAINT "Tar_Group" UNIQUE ("NAME_G");
 ?   ALTER TABLE ONLY public."Tariffs" DROP CONSTRAINT "Tar_Group";
       public         	   darkniter    false    201                       2606    16626    Tariffs Tar_Id 
   CONSTRAINT     K   ALTER TABLE ONLY public."Tariffs"
    ADD CONSTRAINT "Tar_Id" UNIQUE (id);
 <   ALTER TABLE ONLY public."Tariffs" DROP CONSTRAINT "Tar_Id";
       public         	   darkniter    false    201                       2606    16624    Tariffs Tariff_data 
   CONSTRAINT     _   ALTER TABLE ONLY public."Tariffs"
    ADD CONSTRAINT "Tariff_data" PRIMARY KEY (id, "NAME_G");
 A   ALTER TABLE ONLY public."Tariffs" DROP CONSTRAINT "Tariff_data";
       public         	   darkniter    false    201    201            	           2606    16460 
   Users User 
   CONSTRAINT     T   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "User" PRIMARY KEY (id, "Name");
 8   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "User";
       public         	   darkniter    false    200    200            /           2606    16659    Connection_Data Account_data    FK CONSTRAINT     �   ALTER TABLE ONLY public."Connection_Data"
    ADD CONSTRAINT "Account_data" FOREIGN KEY ("Account") REFERENCES public."Accounts"(login) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public."Connection_Data" DROP CONSTRAINT "Account_data";
       public       	   darkniter    false    204    2839    202            .           2606    16654    Connection_Data Device_data    FK CONSTRAINT     �   ALTER TABLE ONLY public."Connection_Data"
    ADD CONSTRAINT "Device_data" FOREIGN KEY (device) REFERENCES public."Equipment"(device_name) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Connection_Data" DROP CONSTRAINT "Device_data";
       public       	   darkniter    false    2835    202    203            +           2606    16649    Staff Division    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Division" FOREIGN KEY ("Division") REFERENCES public."Divisions"("Name") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Division";
       public       	   darkniter    false    198    2821    199            )           2606    16569    Staff Manager    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Manager" FOREIGN KEY ("Management") REFERENCES public."Department_Management"("Name");
 ;   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Manager";
       public       	   darkniter    false    2855    199    206            (           2606    16633    Divisions Manager    FK CONSTRAINT     �   ALTER TABLE ONLY public."Divisions"
    ADD CONSTRAINT "Manager" FOREIGN KEY ("Manager") REFERENCES public."Department_Management"(id) NOT VALID;
 ?   ALTER TABLE ONLY public."Divisions" DROP CONSTRAINT "Manager";
       public       	   darkniter    false    2853    206    198            0           2606    16574    Equipment Node_Name    FK CONSTRAINT     �   ALTER TABLE ONLY public."Equipment"
    ADD CONSTRAINT "Node_Name" FOREIGN KEY (node) REFERENCES public."Node_switches"("Name");
 A   ALTER TABLE ONLY public."Equipment" DROP CONSTRAINT "Node_Name";
       public       	   darkniter    false    2847    205    203            *           2606    16644    Staff Staff_Post    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_Post" FOREIGN KEY ("Post") REFERENCES public."Posts"("Name") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Staff_Post";
       public       	   darkniter    false    196    199    2815            -           2606    16584    Users User_Tariff_Group    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "User_Tariff_Group" FOREIGN KEY ("Tariff") REFERENCES public."Tariffs"("NAME_G") NOT VALID;
 E   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "User_Tariff_Group";
       public       	   darkniter    false    200    2827    201            ,           2606    16579    Users User_account    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "User_account" FOREIGN KEY ("Account") REFERENCES public."Accounts"(login) NOT VALID;
 @   ALTER TABLE ONLY public."Users" DROP CONSTRAINT "User_account";
       public       	   darkniter    false    200    2839    204            �   v   x�-̱
�@��z�a��E�6�RX�,��y���Cm�����<�\��Ƣ�oǺ���0ni\������#M%��*�	���'�]�~�G^�1pW��/-y뻞��������(U      �   �   x���1�0���/��$m�h�M����a�j*IA��B�6�(��/�� p(��l�<�3>��O\h &���\ը���7�&s��-P��de�k��owp{��՜�6�:�P��w��ݺ�:B����x��RG��9��� ɉ�X���v�c��h�      �   �   x�%�I
�0 ��+�B�z�&(z���	�`�����0�0��&�g���+5|�EZINa���*�K��l럜C6���X>L�b��)�e�v�qP�thq��k�e����Iz���> �iN1g      �   J   x�3�L���N-*�4�2�t��+)���4�2�I�P(.-(�/*�4�2�(��+�4�2�t�KO�i1����� ���      �   b   x�3�tq�5�00�42�(ʏ�IL�2���$r�X�EM�j�MM8�8��3��\������F� �H�>�yE��@��u9�Qt��qqq Ӵ�      �   i   x�3�(ʏ�IL�2���wqU�M,.I�2���OI�,����2*��K�,�IU.I,I�2�t���KWp�/��2�t�,���,�T�/�L��K�QpI-.2��c���� yO �      �   T   x�3�t�,JM.�/�44 .#΀��������"Ns��1gpe�cJnf��H���)??(oa�r��g����1z\\\ mkQ      �   �   x���M
1�u{��@�� �.D
ng���Sh;��ފ�҅����H��ڲ�n�ZPG��1%eR�L/peb���&�Y�.L�X��8a8D�358;IT������T�"L���/\�O��TG�D\�ǣ���]�j +�"h�n�0KD��z����,c#���c.�C��C��WZ�'#jg�      �   R   x�.-H-�440�4�
��9��#.��ļNc ����45�4�r*�,�K-.�451�4�rL.���ʙq�q��qqq �iD      �   �   x�-��
1��ݧ�^�{���X(��Y�ń��d�����^3�7�0+�_���@٧���R_�q*� ܺ�H1� �-�!S���	�M3�)�H�w���%wS����+=@��S������MMzv>Z諗�"x_"�� 5H     