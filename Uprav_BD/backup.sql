PGDMP                          x         	   darkniter %   10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)    12.0     r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    16386 	   darkniter    DATABASE     {   CREATE DATABASE darkniter WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'ru_RU.UTF-8' LC_CTYPE = 'ru_RU.UTF-8';
    DROP DATABASE darkniter;
                postgres    false            �            1259    16445    Staff    TABLE     �   CREATE TABLE public."Staff" (
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
            public       	   darkniter    false    199            n          0    16445    Staff 
   TABLE DATA           O   COPY public."Staff" (id, "Name", "Post", "Division", "Management") FROM stdin;
    public       	   darkniter    false    199          v           0    0    Staff_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Staff_id_seq"', 5, true);
          public       	   darkniter    false    213            �
           2606    16452    Staff Id 
   CONSTRAINT     J   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Id" PRIMARY KEY (id);
 6   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Id";
       public         	   darkniter    false    199            �
           2606    16649    Staff Division    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Division" FOREIGN KEY ("Division") REFERENCES public."Divisions"("Name") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Division";
       public       	   darkniter    false    199            �
           2606    16569    Staff Manager    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Manager" FOREIGN KEY ("Management") REFERENCES public."Department_Management"("Name");
 ;   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Manager";
       public       	   darkniter    false    199            �
           2606    16644    Staff Staff_Post    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_Post" FOREIGN KEY ("Post") REFERENCES public."Posts"("Name") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Staff_Post";
       public       	   darkniter    false    199            n   �   x���M
1�u{��@�� �.D
ng���Sh;��ފ�҅����H��ڲ�n�ZPG��1%eR�L/peb���&�Y�.L�X��8a8D�358;IT������T�"L���/\�O��TG�D\�ǣ���]�j +�"h�n�0KD��z����,c#���c.�C��C��WZ�'#jg�     