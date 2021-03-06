PGDMP     +                    y            potterworld #   12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)     13.1 (Ubuntu 13.1-1.pgdg20.04+1) m    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16654    potterworld    DATABASE     `   CREATE DATABASE potterworld WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'fr_FR.UTF-8';
    DROP DATABASE potterworld;
                potterworld    false            �           0    0    DATABASE potterworld    ACL     ,   GRANT ALL ON DATABASE potterworld TO admin;
                   potterworld    false    3223            �            1259    16669    blood    TABLE     �   CREATE TABLE public.blood (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.blood;
       public         heap    postgres    false            �            1259    16667    blood_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blood_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.blood_id_seq;
       public          postgres    false    205            �           0    0    blood_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.blood_id_seq OWNED BY public.blood.id;
          public          postgres    false    204            �            1259    16753 	   character    TABLE       CREATE TABLE public."character" (
    id integer NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    birthday timestamp without time zone DEFAULT now() NOT NULL,
    deaththday text,
    surnom text NOT NULL,
    patronus text NOT NULL,
    maison text NOT NULL,
    school_id integer NOT NULL,
    blood_id integer NOT NULL,
    family_id integer NOT NULL,
    father_id integer NOT NULL,
    mother_id integer NOT NULL,
    brother_sister text NOT NULL,
    cousin text NOT NULL,
    oncle_tante text NOT NULL,
    married text NOT NULL,
    child text NOT NULL,
    neveu text NOT NULL,
    beau_frere text NOT NULL,
    animal text NOT NULL,
    home text NOT NULL,
    url text NOT NULL,
    other_feature text NOT NULL,
    job text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    lieu_naissance text,
    why_this_name text,
    cause_deces text,
    other_family text,
    father_name character varying(255),
    mother_name character varying(255)
);
    DROP TABLE public."character";
       public         heap    postgres    false            �            1259    16853    character_has_family    TABLE     �   CREATE TABLE public.character_has_family (
    character_id integer NOT NULL,
    family_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 (   DROP TABLE public.character_has_family;
       public         heap    postgres    false            �            1259    16869    character_has_friend    TABLE     �   CREATE TABLE public.character_has_friend (
    character_id integer NOT NULL,
    friend_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 (   DROP TABLE public.character_has_friend;
       public         heap    postgres    false            �            1259    16805    character_has_maison    TABLE     �   CREATE TABLE public.character_has_maison (
    character_id integer NOT NULL,
    school_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 (   DROP TABLE public.character_has_maison;
       public         heap    postgres    false            �            1259    16837    character_has_organisation    TABLE     �   CREATE TABLE public.character_has_organisation (
    character_id integer NOT NULL,
    organisation_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 .   DROP TABLE public.character_has_organisation;
       public         heap    postgres    false            �            1259    16789    character_has_school    TABLE     �   CREATE TABLE public.character_has_school (
    character_id integer NOT NULL,
    school_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 (   DROP TABLE public.character_has_school;
       public         heap    postgres    false            �            1259    16821    character_has_type    TABLE     �   CREATE TABLE public.character_has_type (
    type_id integer NOT NULL,
    character_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 &   DROP TABLE public.character_has_type;
       public         heap    postgres    false            �            1259    16751    character_id_seq    SEQUENCE     �   CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.character_id_seq;
       public          postgres    false    219            �           0    0    character_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.character_id_seq OWNED BY public."character".id;
          public          postgres    false    218            �            1259    16705    family    TABLE     �   CREATE TABLE public.family (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.family;
       public         heap    postgres    false            �            1259    16703    family_id_seq    SEQUENCE     �   CREATE SEQUENCE public.family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.family_id_seq;
       public          postgres    false    211            �           0    0    family_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.family_id_seq OWNED BY public.family.id;
          public          postgres    false    210            �            1259    16657    friend    TABLE     �   CREATE TABLE public.friend (
    id integer NOT NULL,
    character_name text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.friend;
       public         heap    postgres    false            �            1259    16655    friend_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friend_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.friend_id_seq;
       public          postgres    false    203            �           0    0    friend_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.friend_id_seq OWNED BY public.friend.id;
          public          postgres    false    202            �            1259    16681    maison    TABLE       CREATE TABLE public.maison (
    id integer NOT NULL,
    name text NOT NULL,
    creator text NOT NULL,
    embleme text,
    director_list text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.maison;
       public         heap    postgres    false            �            1259    16679    maison_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maison_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.maison_id_seq;
       public          postgres    false    207            �           0    0    maison_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.maison_id_seq OWNED BY public.maison.id;
          public          postgres    false    206            �            1259    16693    organisation    TABLE     !  CREATE TABLE public.organisation (
    id integer NOT NULL,
    name text NOT NULL,
    description_courte text NOT NULL,
    descritpion_longue text,
    image text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
     DROP TABLE public.organisation;
       public         heap    postgres    false            �            1259    16691    organisation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.organisation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.organisation_id_seq;
       public          postgres    false    209            �           0    0    organisation_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.organisation_id_seq OWNED BY public.organisation.id;
          public          postgres    false    208            �            1259    16741    school    TABLE     �  CREATE TABLE public.school (
    id integer NOT NULL,
    name text NOT NULL,
    descritpion_courte text NOT NULL,
    description_longue text NOT NULL,
    director_name text NOT NULL,
    localisation text NOT NULL,
    embleme text NOT NULL,
    image text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.school;
       public         heap    postgres    false            �            1259    16885    school_has_maison    TABLE     �   CREATE TABLE public.school_has_maison (
    school_id integer NOT NULL,
    maison_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
 %   DROP TABLE public.school_has_maison;
       public         heap    postgres    false            �            1259    16739    school_id_seq    SEQUENCE     �   CREATE SEQUENCE public.school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.school_id_seq;
       public          postgres    false    217            �           0    0    school_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.school_id_seq OWNED BY public.school.id;
          public          postgres    false    216            �            1259    16729    spell    TABLE       CREATE TABLE public.spell (
    id integer NOT NULL,
    name text NOT NULL,
    description_courte text NOT NULL,
    description_longue text,
    category text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.spell;
       public         heap    postgres    false            �            1259    16727    sort_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sort_id_seq;
       public          postgres    false    215            �           0    0    sort_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.sort_id_seq OWNED BY public.spell.id;
          public          postgres    false    214            �            1259    16717    type    TABLE     �   CREATE TABLE public.type (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);
    DROP TABLE public.type;
       public         heap    postgres    false            �            1259    16715    type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.type_id_seq;
       public          postgres    false    213            �           0    0    type_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;
          public          postgres    false    212            �           2604    16672    blood id    DEFAULT     d   ALTER TABLE ONLY public.blood ALTER COLUMN id SET DEFAULT nextval('public.blood_id_seq'::regclass);
 7   ALTER TABLE public.blood ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    16756    character id    DEFAULT     n   ALTER TABLE ONLY public."character" ALTER COLUMN id SET DEFAULT nextval('public.character_id_seq'::regclass);
 =   ALTER TABLE public."character" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    16708 	   family id    DEFAULT     f   ALTER TABLE ONLY public.family ALTER COLUMN id SET DEFAULT nextval('public.family_id_seq'::regclass);
 8   ALTER TABLE public.family ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    16660 	   friend id    DEFAULT     f   ALTER TABLE ONLY public.friend ALTER COLUMN id SET DEFAULT nextval('public.friend_id_seq'::regclass);
 8   ALTER TABLE public.friend ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    16684 	   maison id    DEFAULT     f   ALTER TABLE ONLY public.maison ALTER COLUMN id SET DEFAULT nextval('public.maison_id_seq'::regclass);
 8   ALTER TABLE public.maison ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    16696    organisation id    DEFAULT     r   ALTER TABLE ONLY public.organisation ALTER COLUMN id SET DEFAULT nextval('public.organisation_id_seq'::regclass);
 >   ALTER TABLE public.organisation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    16744 	   school id    DEFAULT     f   ALTER TABLE ONLY public.school ALTER COLUMN id SET DEFAULT nextval('public.school_id_seq'::regclass);
 8   ALTER TABLE public.school ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16732    spell id    DEFAULT     c   ALTER TABLE ONLY public.spell ALTER COLUMN id SET DEFAULT nextval('public.sort_id_seq'::regclass);
 7   ALTER TABLE public.spell ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16720    type id    DEFAULT     b   ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);
 6   ALTER TABLE public.type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            |          0    16669    blood 
   TABLE DATA           A   COPY public.blood (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    205   ��       �          0    16753 	   character 
   TABLE DATA             COPY public."character" (id, firstname, lastname, birthday, deaththday, surnom, patronus, maison, school_id, blood_id, family_id, father_id, mother_id, brother_sister, cousin, oncle_tante, married, child, neveu, beau_frere, animal, home, url, other_feature, job, created_at, updated_at, lieu_naissance, why_this_name, cause_deces, other_family, father_name, mother_name) FROM stdin;
    public          postgres    false    219   ��       �          0    16853    character_has_family 
   TABLE DATA           _   COPY public.character_has_family (character_id, family_id, created_at, updated_at) FROM stdin;
    public          postgres    false    224   ��       �          0    16869    character_has_friend 
   TABLE DATA           _   COPY public.character_has_friend (character_id, friend_id, created_at, updated_at) FROM stdin;
    public          postgres    false    225   ��       �          0    16805    character_has_maison 
   TABLE DATA           _   COPY public.character_has_maison (character_id, school_id, created_at, updated_at) FROM stdin;
    public          postgres    false    221   ��       �          0    16837    character_has_organisation 
   TABLE DATA           k   COPY public.character_has_organisation (character_id, organisation_id, created_at, updated_at) FROM stdin;
    public          postgres    false    223   ��       �          0    16789    character_has_school 
   TABLE DATA           _   COPY public.character_has_school (character_id, school_id, created_at, updated_at) FROM stdin;
    public          postgres    false    220   �       �          0    16821    character_has_type 
   TABLE DATA           [   COPY public.character_has_type (type_id, character_id, created_at, updated_at) FROM stdin;
    public          postgres    false    222   %�       �          0    16705    family 
   TABLE DATA           B   COPY public.family (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    211   B�       z          0    16657    friend 
   TABLE DATA           L   COPY public.friend (id, character_name, created_at, updated_at) FROM stdin;
    public          postgres    false    203   ��       ~          0    16681    maison 
   TABLE DATA           c   COPY public.maison (id, name, creator, embleme, director_list, created_at, updated_at) FROM stdin;
    public          postgres    false    207   ��       �          0    16693    organisation 
   TABLE DATA           w   COPY public.organisation (id, name, description_courte, descritpion_longue, image, created_at, updated_at) FROM stdin;
    public          postgres    false    209   �       �          0    16741    school 
   TABLE DATA           �   COPY public.school (id, name, descritpion_courte, description_longue, director_name, localisation, embleme, image, created_at, updated_at) FROM stdin;
    public          postgres    false    217   ��       �          0    16885    school_has_maison 
   TABLE DATA           Y   COPY public.school_has_maison (school_id, maison_id, created_at, updated_at) FROM stdin;
    public          postgres    false    226   t�       �          0    16729    spell 
   TABLE DATA           s   COPY public.spell (id, name, description_courte, description_longue, category, created_at, updated_at) FROM stdin;
    public          postgres    false    215   ��       �          0    16717    type 
   TABLE DATA           @   COPY public.type (id, name, created_at, updated_at) FROM stdin;
    public          postgres    false    213   �      �           0    0    blood_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.blood_id_seq', 1, false);
          public          postgres    false    204            �           0    0    character_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.character_id_seq', 1, true);
          public          postgres    false    218            �           0    0    family_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.family_id_seq', 1, false);
          public          postgres    false    210            �           0    0    friend_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.friend_id_seq', 1, false);
          public          postgres    false    202            �           0    0    maison_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.maison_id_seq', 1, false);
          public          postgres    false    206            �           0    0    organisation_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.organisation_id_seq', 1, false);
          public          postgres    false    208            �           0    0    school_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.school_id_seq', 6, true);
          public          postgres    false    216            �           0    0    sort_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sort_id_seq', 31, true);
          public          postgres    false    214            �           0    0    type_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.type_id_seq', 1, false);
          public          postgres    false    212            �           2606    16678    blood blood_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.blood
    ADD CONSTRAINT blood_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.blood DROP CONSTRAINT blood_pkey;
       public            postgres    false    205            �           2606    16858 .   character_has_family character_has_family_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.character_has_family
    ADD CONSTRAINT character_has_family_pkey PRIMARY KEY (character_id, family_id);
 X   ALTER TABLE ONLY public.character_has_family DROP CONSTRAINT character_has_family_pkey;
       public            postgres    false    224    224            �           2606    16874 .   character_has_friend character_has_friend_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.character_has_friend
    ADD CONSTRAINT character_has_friend_pkey PRIMARY KEY (character_id, friend_id);
 X   ALTER TABLE ONLY public.character_has_friend DROP CONSTRAINT character_has_friend_pkey;
       public            postgres    false    225    225            �           2606    16810 .   character_has_maison character_has_maison_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.character_has_maison
    ADD CONSTRAINT character_has_maison_pkey PRIMARY KEY (character_id, school_id);
 X   ALTER TABLE ONLY public.character_has_maison DROP CONSTRAINT character_has_maison_pkey;
       public            postgres    false    221    221            �           2606    16842 :   character_has_organisation character_has_organisation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.character_has_organisation
    ADD CONSTRAINT character_has_organisation_pkey PRIMARY KEY (character_id, organisation_id);
 d   ALTER TABLE ONLY public.character_has_organisation DROP CONSTRAINT character_has_organisation_pkey;
       public            postgres    false    223    223            �           2606    16794 .   character_has_school character_has_school_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.character_has_school
    ADD CONSTRAINT character_has_school_pkey PRIMARY KEY (character_id, school_id);
 X   ALTER TABLE ONLY public.character_has_school DROP CONSTRAINT character_has_school_pkey;
       public            postgres    false    220    220            �           2606    16826 *   character_has_type character_has_type_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.character_has_type
    ADD CONSTRAINT character_has_type_pkey PRIMARY KEY (type_id, character_id);
 T   ALTER TABLE ONLY public.character_has_type DROP CONSTRAINT character_has_type_pkey;
       public            postgres    false    222    222            �           2606    16763    character character_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_pkey;
       public            postgres    false    219            �           2606    16714    family family_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.family DROP CONSTRAINT family_pkey;
       public            postgres    false    211            �           2606    16666    friend friend_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.friend
    ADD CONSTRAINT friend_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.friend DROP CONSTRAINT friend_pkey;
       public            postgres    false    203            �           2606    16690    maison maison_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.maison
    ADD CONSTRAINT maison_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.maison DROP CONSTRAINT maison_pkey;
       public            postgres    false    207            �           2606    16702    organisation organisation_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.organisation
    ADD CONSTRAINT organisation_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.organisation DROP CONSTRAINT organisation_pkey;
       public            postgres    false    209            �           2606    16890 (   school_has_maison school_has_maison_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.school_has_maison
    ADD CONSTRAINT school_has_maison_pkey PRIMARY KEY (school_id, maison_id);
 R   ALTER TABLE ONLY public.school_has_maison DROP CONSTRAINT school_has_maison_pkey;
       public            postgres    false    226    226            �           2606    16750    school school_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.school
    ADD CONSTRAINT school_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.school DROP CONSTRAINT school_pkey;
       public            postgres    false    217            �           2606    16738    spell sort_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY public.spell
    ADD CONSTRAINT sort_pkey PRIMARY KEY (id);
 9   ALTER TABLE ONLY public.spell DROP CONSTRAINT sort_pkey;
       public            postgres    false    215            �           2606    16726    type type_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.type DROP CONSTRAINT type_pkey;
       public            postgres    false    213            �           2606    16769 !   character character_blood_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_blood_id_fkey FOREIGN KEY (blood_id) REFERENCES public.blood(id);
 M   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_blood_id_fkey;
       public          postgres    false    3019    205    219            �           2606    16774 "   character character_family_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_family_id_fkey FOREIGN KEY (family_id) REFERENCES public.family(id);
 N   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_family_id_fkey;
       public          postgres    false    211    3025    219            �           2606    16779 "   character character_father_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_father_id_fkey FOREIGN KEY (father_id) REFERENCES public."character"(id);
 N   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_father_id_fkey;
       public          postgres    false    219    219    3033            �           2606    16859 ;   character_has_family character_has_family_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_family
    ADD CONSTRAINT character_has_family_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 e   ALTER TABLE ONLY public.character_has_family DROP CONSTRAINT character_has_family_character_id_fkey;
       public          postgres    false    219    3033    224            �           2606    16864 8   character_has_family character_has_family_family_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_family
    ADD CONSTRAINT character_has_family_family_id_fkey FOREIGN KEY (family_id) REFERENCES public.family(id);
 b   ALTER TABLE ONLY public.character_has_family DROP CONSTRAINT character_has_family_family_id_fkey;
       public          postgres    false    224    211    3025            �           2606    16875 ;   character_has_friend character_has_friend_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_friend
    ADD CONSTRAINT character_has_friend_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 e   ALTER TABLE ONLY public.character_has_friend DROP CONSTRAINT character_has_friend_character_id_fkey;
       public          postgres    false    219    225    3033            �           2606    16880 8   character_has_friend character_has_friend_friend_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_friend
    ADD CONSTRAINT character_has_friend_friend_id_fkey FOREIGN KEY (friend_id) REFERENCES public.friend(id);
 b   ALTER TABLE ONLY public.character_has_friend DROP CONSTRAINT character_has_friend_friend_id_fkey;
       public          postgres    false    225    3017    203            �           2606    16811 ;   character_has_maison character_has_maison_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_maison
    ADD CONSTRAINT character_has_maison_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 e   ALTER TABLE ONLY public.character_has_maison DROP CONSTRAINT character_has_maison_character_id_fkey;
       public          postgres    false    3033    221    219            �           2606    16816 8   character_has_maison character_has_maison_school_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_maison
    ADD CONSTRAINT character_has_maison_school_id_fkey FOREIGN KEY (school_id) REFERENCES public.school(id);
 b   ALTER TABLE ONLY public.character_has_maison DROP CONSTRAINT character_has_maison_school_id_fkey;
       public          postgres    false    217    3031    221            �           2606    16843 G   character_has_organisation character_has_organisation_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_organisation
    ADD CONSTRAINT character_has_organisation_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 q   ALTER TABLE ONLY public.character_has_organisation DROP CONSTRAINT character_has_organisation_character_id_fkey;
       public          postgres    false    3033    219    223            �           2606    16848 J   character_has_organisation character_has_organisation_organisation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_organisation
    ADD CONSTRAINT character_has_organisation_organisation_id_fkey FOREIGN KEY (organisation_id) REFERENCES public.organisation(id);
 t   ALTER TABLE ONLY public.character_has_organisation DROP CONSTRAINT character_has_organisation_organisation_id_fkey;
       public          postgres    false    209    223    3023            �           2606    16795 ;   character_has_school character_has_school_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_school
    ADD CONSTRAINT character_has_school_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 e   ALTER TABLE ONLY public.character_has_school DROP CONSTRAINT character_has_school_character_id_fkey;
       public          postgres    false    220    3033    219            �           2606    16800 8   character_has_school character_has_school_school_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_school
    ADD CONSTRAINT character_has_school_school_id_fkey FOREIGN KEY (school_id) REFERENCES public.school(id);
 b   ALTER TABLE ONLY public.character_has_school DROP CONSTRAINT character_has_school_school_id_fkey;
       public          postgres    false    3031    220    217            �           2606    16832 7   character_has_type character_has_type_character_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_type
    ADD CONSTRAINT character_has_type_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);
 a   ALTER TABLE ONLY public.character_has_type DROP CONSTRAINT character_has_type_character_id_fkey;
       public          postgres    false    219    3033    222            �           2606    16827 2   character_has_type character_has_type_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.character_has_type
    ADD CONSTRAINT character_has_type_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(id);
 \   ALTER TABLE ONLY public.character_has_type DROP CONSTRAINT character_has_type_type_id_fkey;
       public          postgres    false    3027    222    213            �           2606    16784 "   character character_mother_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_mother_id_fkey FOREIGN KEY (mother_id) REFERENCES public."character"(id);
 N   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_mother_id_fkey;
       public          postgres    false    3033    219    219            �           2606    16764 "   character character_school_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_school_id_fkey FOREIGN KEY (school_id) REFERENCES public.school(id);
 N   ALTER TABLE ONLY public."character" DROP CONSTRAINT character_school_id_fkey;
       public          postgres    false    3031    219    217            �           2606    16896 2   school_has_maison school_has_maison_maison_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_has_maison
    ADD CONSTRAINT school_has_maison_maison_id_fkey FOREIGN KEY (maison_id) REFERENCES public.maison(id);
 \   ALTER TABLE ONLY public.school_has_maison DROP CONSTRAINT school_has_maison_maison_id_fkey;
       public          postgres    false    207    226    3021            �           2606    16891 2   school_has_maison school_has_maison_school_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.school_has_maison
    ADD CONSTRAINT school_has_maison_school_id_fkey FOREIGN KEY (school_id) REFERENCES public.school(id);
 \   ALTER TABLE ONLY public.school_has_maison DROP CONSTRAINT school_has_maison_school_id_fkey;
       public          postgres    false    217    226    3031            �           826    16975    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     P   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES  TO potterworld;
                   postgres    false            |   �   x���1�  ��s�^�>m�nƘ��ŵ�Ր 5�$z$���|�7=	gn��P��Bsl
T�Эԥ�d����O��v9VA�S�7EBVp�C�ppW�4�-��l �v�z���p|�����-t9�� ��_��{B��d�} KS[�      �      x��}KsW������|�EG�*H���"%�(�a{".2/���p>(ѫ���W�cx�e�D�l*&b�vD��_2�;�ܛ7A���vM�twW�H0�y�>��;��~�;)����5Uf/��ii�غ����m���F�[���'�����q�ENب��|SL&���ҔQU���ݲh���<.��=)/��"O���M��w�!���LR�G��������s����rS�M���K����uj��������zޔ���Y6���R;�Nm_�ǥM��[�3��e���q���=*˂��h�N�&Jl��hjtk�6�<+�+��̎{�6ze�2�eo�	���,m����Nmӷ����m�:��2����5������4����O�ջ��l9�*��Qe���鏸*il�_����{�Տ��i�iqAC����m=�<�������2Z��y�a,mS�V�m�&Zu�oI�Y��&��t����FUS���;��S�YQ㷱_�O�g4U��aD�I|�����2:-ʺ�`�C33-�i�&��#����J~��LY^����m5M�j,���ν�~��uNz���v魷�?�[o�=����>���̖K��[�n�/M6iʙ�>9����>u[�s����;����Κ�~�o�ZwS�����Vuirl��<)��ML��ȿ���sS�iU��6-��1��	����]5_�+SZ�(6�e����n����*�!�4æ���Ni᳢��k�*���mM;�6 }dh柔�ba�2������h�"SU��h�}L���5?,����=��О^�6:O���x�6߲��]s������n޿~��L��V��"�Q�N�C��!�@��K%&�pj��j^������:����Sz���h��9h���a=���f2�n�Ny�d�����um���˷/;�no{��P7�l����<ׯ������ ��i�����B{��6+�k� ��䐞�s[ҖY�;�����N�>�SZ�&'�OUA��QS�ļi��,8-H딽G	'c��h�L6��eLW��\]^]>)�2�i�����hY�7��^xd1��RnZ�<J�Տ3Kg�v�Đl^`����:G곢4��ϲf6/�|a�"s9�#25�?�&�s֤uzn����MJG��.�Hמ����t|1��U��KlIB/��t��`]B;���zN���i�zG����(��.���2|]iE�!��T4��L�%5B]�&��t��:�8ѿ1Ѽ��O?�������4��7�i�?�I�w����o>6��d]�`>�(���Du��@����������3��l�y���.HO���k�XoFS���K�*.�%��c\]�3K�D���A떓YA3_�
�qL
�Is��5wl��ޕF�[X�����;koz���"�NЈ���wVаw�E�F;��p2�wR�t��pq�B���p����̭>�}/Jwh����}�%��@^�^�da���sa����t��'��]����,��)��v�?��Z�M�#-�/��;[�֤�y��ϲ�]��������ֽ��N���}�hU��X�)_�]��"���LPV�]L�ǘX���f9����%cܑm��Qߚ��e*^Y�j
�^IA�]�_Y����
g��%{� ��t�ڶ=���<�K31Um��~e��/2K�"-�E<q�>��*��Ղn05p�G�Uܲ��I�=҉0��79t�]Ȧ��g�,'E�*遼X�Z@oOJ�d
��٤�6�����S��d�@�B�o*�N���p��촜�� r�6MU��Y.m����fa�/hd�^�45;�W�v񌦐�X&�>-Ⱥk�\}�<y����~�7��.�Z��9��m�S���������f��d�Y��H�V�����&C��,0���(�Y5G�,�zK���&�f�+ƕL�ؖ�!�%����)�s][a���7�&��"��`
J�K�vL�9������az����4���QE6���8Y��4p��s�;�e"��v��,t<�so*���U�af�]h�t7��'2>*<oJk���ld��6�r���sy�	�tH1�~r��{�B݁~V��R��{|�@�n�;����W�_�9V�������h2���E�֟Dv:��'�tH�4��M�0�a3L.��w�鿈�Dq���;0�[;�$�����8���$�ɬn�������/� �2���1��O�����֖4������D����V�������� p|����P�p2�]��I�YY�򡍄3��*gVf;�o<�	mH:Bt lEGL�LC3ޗ��ջq��qL�����g��]C+VMM�D�<�w����с ��G�ӻO>��V͌�9�(V>��6u�z��V�m�
w�!$�}AȜ���M�sŦ�)m`>�_�S�DS}��[���
�us�sh�*�����ë���=�A��x� m�e�����uD@���x���^�҇��vj�f�����9�Ԅ�2l_���I�$��9	�<�&&7�!��m���FE��X~�3.����FPi
xP��DZ�xc=��_��ߐ��Y6Dc��!cN��㫋�)�r�N
iW����A������o�����E�&@�N�ǁ>��D�~}e����g�4��h��#^W��s_\܎�DuK�D{��v���xn�׈b�@|�L�_��p�.J��uEF�J,���gЖ��Y:��`'¦x�7��m�u6��u��ф�p���ؚ�W�gߐS�IJ����';�ߐ@�A�d��z���[�6�zp�����X���f�a�D{�t������^�\\�h�,��7�U�Mn�'_�1ل��mdJ��m��11U�+R&�q�,�H��3�>��;8FO_}�M�����i?�t��g�􌿿�иƽϱ[H0�ѩ��I�'~f�ޣ�����v�m���b�/L�*�ל�e�,��6o����"��b�N8� �QQ�߃�Q-�҇d��&%=���D>#~��y��Y���c-�[E;[[�4a�q^=�Y$���S��?g�MJv�Zs2�L�p��UQA�҅�ȯ�4κ�;���62��z�&��$4����Q���ӈ�j��H�I�NӐ� W��l;9%E�O�+�%��#��Bt1�tԆ�������4��=�����6=���%#	�LK���&��9lI���47��ji���<�I���SȰ%1���J��ebI���aV��N[̚
kXE�iԬ��t:%Y�d�N������ ��	R���a^�d��lo0�f)�VB����?/��	�:�,�,mj�P�:l7�l�F��Di�C������)Z����A��?&w;E�M��V���0=���
7��Qp�H��M�x]|�4��i�ٰ�x4�(x�a����ۗ�s^�j��=�G6TX�^p����o�($^3Z�,� c(��6[tQ����??=���ϴU�8��?�$	�2(`4��!�)gÔ�.Dcʘ��
�p`��"���R���G��z���_?�?��Ok�ތ�I8��0d�ǉam��D�RU|��!}gdu�Ht�j=�~[���ILZk��m���bzn�dM��U��9;R��{�8a�_�e�aG)���;.���(�����<q�J�l
��	(���J��N�9�A(�,��Q�O=K$�S$�.y�"gEk�Q�SS��$�JJ��-7����� ,���q�Of��q����u�"@�[����/y�����[}r��,m�Տ�ո�x�X�D���;��5;-��R<S��r�Y��,��v�����<�z�,�f������N'��)4J�Y&�K�L�T�3Z��G����5������gF^�Qd�˼!}���#��-Y��Gt6G/��sK?����T#D��Y���؎��{��Yx���W�+D�~�5���%�v�㌶K����N�x���!�逬��J���n%n<i$�d�B�������"�d{�����dHOa����h��~������I�B�4����x��ϰ�>�`�cͣ�����vb!�����n�    �1�mo���_���%bd.��+�n���4��&��&�m�6ܱ��Y*��|�҇�L��at��!W.d��ֲy�i[(�`�B�~X���]9<�VD�0f�'8b�
��iM99���֝�aTT.���,ߴ�6	;]u��ǒv@/�x�������`/5$�H�`�d�e��^�;�N(�k(qUܬc���ZQq�3�����Q"\X]�h�s�"n՗����FVy{�h_6�9�R�����������w�H�Ap�4v�������)_�WO�u@��[%���e".���hÑ���S��A��q&�2�G���䵭yy�[b�`=�і\"� � 扑[�[���u�%v�/�(�hR�t�p6؃��.�O'f�-�{��ULHɥ0EL0�������(x>!i`z�A4%l���I|�B�U[�L+��4SWgkp[6�e
�X�JA8r�ÁԶ��_翩��%�1#��i�Jl���V��Q�x�6`�IkY6*�H63��	����6���u��q�v.�3�3����[w��P�/ut����N�s1k�X
+{�OK��F���8^���vׂ�ﾸ7��ᣋ`�X1I���w_Rb!�i�h)�N��03�91ѕ��%��x��tS��J؇t�����$��F���|�7È%%���U��>9��Ohp�Z:$������9t�QU�����+N��_���g�xk�(�e�I��>ز�sq,xfq.�u�^s��F9��!'�� }��o>�]�[C�]ϵy�:C�o`���87"���ꇚ}��F>�ױ�rl$T�)y���!l{�� �X<lk�vS��
9�?C4!��*`�x�_k� ����Y�e��f�8�E#/�V?Ѻ��3dwh%_�F	�);;��X���.�g����fEvC�*��bl�ֆ�VeTm�kp�����aL��1}���T�E�R�.^�ݑ'� ���(j��x�	&	�&w��&�����l��b7�3z�V��˨���m��H��=�YKsһ��Y�з��^u�G>ˠ�JU����䰧<
	�B�2菄���nC�d5�R���0�]I����1�+�z�A��P��Q/͛*nؚ���������� �$;ho��Z�5oOD�W`K@�ݒ�	����i�a���Y�����L�1�g�b�8�|r�d��ޱ�AI>H��*��Jj�td�[86�YB��}��m-�F`��S3A�J�:*iiM�1N��h�x�����<�f!aĔY2��L29$�$��B.fA&��� ����� �-�o$
��%C��G��Y�����9�<��̈́3�,���H�'Ǻ�ZS� �!i8�ST�Z����^�b�� �Y;�e:�>��UcGM�����f1`�3��GXSoJ^��	���t��h��P�향�lq�/�րn���!�#��l-Hڥ��	2���,g��&�ΐ`^T�rc�u5����lV�0`e�;�u�0|�bo?0 vj+�Ӿ������ݍp��[�������n��"��@�l&MM��.˥$�V6��` ����$Xټ����E������-&떵7g}
x������#���ak.��Mr�d�,�W`�5�����5�p):v%&�naH�*z��.�t!?�EvOS�}�MZJ�@�g&)a��&@�Ht�	d&�p�澅��q�����S��/�9�M�q�BZ��t@$����t��56�s 3��d�&����X���y��3��	<T�Ҟ��3�]�_�4���yQ�䱒��r{�4�����Iu�7s�2K��ؤ���I��bQ�d�Y�~�{�ܚe�IH8�	C�o&����V�N���b~�u�Ty���v����X+�a����!�*į�m({�������sH��i��$%FG�%$�n}�M[�H��D���;a�-��WeJ���3�e���#��<�P��V�wi��0̛�[���^��(�EgI��W�';"�`s��>���ۻ=M�ZZ�G_6ٴL�蠤��k�v����}�ܤ�w>k_��4I�p�Ze�Fg;	�";�U����nV0����!�}k9� ��w��h�$&A������J����ac�&���F�ڪ�2��1&_/9���8���y�(*�V0T�h3����6@T��a�(	�?��"k�ɒ���z����ŋ�M���|T���Kd'�&��p�%�LX�QҾ�)�w��Gg�&"�OH�䀓 �#tT��J�d�F�W/N�i<�,�)����X�E>]�ct�������D��0T�s��=J�]6:�e�x����N?Al���r�mP�#���Q�>���"�i�xNzĮaϮG9Z[^�-�C>β_�DS�N��j��a/:�5�|Ós�T����|]��?:ۆ�@������i G#�� L*��*�ޓ�˒�6�϶�"����A�kR.��~��呼}9�L�*0�|����oM��D��."���vt0I�&@4E�WǇ�1�VF���T�.�������C���,�k6�k�lO��Co֚o��d"I�O,.	��u���C�X�)��~�١��4�*C�-4j!�����P>5�4�&(x��%�Ë� ��(Nb�?�qk��Z��\���̈m ��Lcx,�:����B�XN)#���p���Ʀ�׹�L����� xŪcYE�����G�BN'k��Fv�:�-UV� �B,	�f��ɾ#aK6�b ���Fr�>2���j�d�T�0CQDjq�6�[$[+a�]�����X�2�xC��b]�>��v�ES�2���w�a�`�pPH�s2/S5=E9f>̙�bʵW�2�!�y�;�s�kCפ2�Ip�����+p���{%��>�>��h�8S2nI���wUؑ>�IC��^l�~���c�T?=�ߖ��9�, ���*�0�!��x�΋����$\��$��8��Up��b�S�E0����G
�ݞ`����pP���2�����GGǭ�k��Kɷ'%Ms��,lTI^B�xN��Dj�N8t�J4�@8T5q��G>���S�OFZ�JpȒ�H� ���9�gd���{��fH}qe b�ɔ9���KB#fL�
UjC�iZ�.�`9�$�9D���1fN8我a�XS"�M3�*�#��H�ݲ��V�]�Ѡ7�X��̀�) �+�p��,
�B���^�V�%Nn%�I"�Q���O3�b�և�1�n��b�8��/M5'��4agBn�(��D��@:.rqm���>��m�YīK�&g�P;�V�O��] �D�%��H�)�{�#d]�&�
H��9�ed[��=�L�Wʊ�v���$��_TpEJ�,r�����B\��!N�/���E:tܡF�gg�ds��Sa,�8��3SYë(؅��$�Dű$=ə�ѐ!�
����e��)BDA����U�Z�^�ٛ���!t�EF��k9���d�s�G][:�B��J��ldN5ɥqN�vFf�ܶ�lZ�N�KZ�7NB+������Ґ�Ɨ��������c��`�I���Gr
k�l����a݇N����{D��(�͊�P�*$���޹{aG���b���*y�	������%:�C�Ut�����i��bWYu����!(�s����[մ�_��J*�57�sV>�*���p�6ul"�I���:�Hf )]�uV�=v
@CǍF��]�ϠAc��i;�5p�b��@��.:(��Έ0~/ũ���:�`pi�t����>-���ArlA~Ēv/S4Y�z�){�g�!r�&e-!��]ր4L+@�=DD.u���OE_�����)#h�"ҳ.ŭ"�SVC�S����n]?�J��J�a"�ۀ1 ��G^9����4�!x���g�pj8#�@6DEl�:[�!�e[���xa����f�`q5Gv. �pZY�s��>�T:�G���yqa|ΆK��҃��=�u8n�������<��%e�����&�S�b���    ���u���{���;iY%Y�PBg�7J+�D���Yq�I�jΰq:!�4:���L��tJ�]�v�z]���<��
�ީ�;J��yK\}�}+�f1�5/��NK�z	RC3�^�Tlu�}�1�~y~��)�^�&��ڳՁ{��$f)�tgk�/�Q�t'��,] ?k��E�%���~q�����R���O�N>��c���r����Nge�f����n8�����+���ܮD�xQx9�ս��=�'����,�$���D�qQ���Q���"�u����)�W�í��X�1#h�\]��-��k�Xf��dő9��c���J#u��!����QD�����ҁ`� &���G�5&�&�q50���FE?.���g�fn*�@�4M۹�mgЭ��g�;��}>�����R#1���˂��3�T�|��e�1V�M����4~^���l��0h���x< D����!�혴���_T�Ս�H�����iDHsAv�;g���|�ۘ�����S1���Ձ^L%���ߦY���(��Z2s���EtV��Q-5���<�7��a��]x��e� �Z��훡dC5�� �H �
�y��a�~�G�Vǔit[
�k>���|�[����P�4_@�i���[_Y�Q�s���D�����{c�F��?��䑁Dgd��ajy�D�*�+���jr�8f���I�^q�Q[)�~�̔��׆1}�Q�o[������R�AVv�6���M��p��C��VxF�hs���)c/*U��WjF�*)\�[;d�o$���:%����,�@���vhh�0Ɉ2L|Ù<QE�V�S�@qh*V�����!H���.t���4�7�ԴԐ�'�sCv�+��p�=J�>��Io-�w�[@t���f�=��(,1,C�ց��q��`�0v/��(\�;|Y	�t�U��#�@���K�������_�G�	2Mt@K-%�,dw[W�8M��7c
1�����ht�T!+�ޭ��n&��R�4\��lu:*l��$k�X���m��Jm�S���p͡^0�]P������h+]�l����{h��|>]���5��5 ��Rj�=� gQ�O93z��hx2~��B������ظ��� ��F���� ?�,�6�8�zmъ9w�G�f��� �%��9��(LK�a$���������m����pZ8��Hr��9�T3v�p�Y���'��S�V���rE� ��	+v_^V:���� �4;=��x�c��WQB!/�@:��+EY�ФW�$]y.
���a#��9o#��;�$`8$��7����ȭ4]T�:i�e]0�^�6��Bb��Goc2&������-���R���Q��3qP��V�hI�l��5Z:sh‿�Sr5�$���"ΐ�JR��I�X�+zs�D9s�5��gw-|\�G��O����si��/�ZV�{����C��y�1a� Ӌ�ދ&�Mj��{��#�n�����d!��I�\'��3��Zf���Z�5��0�
�8��S!��K��{���4�;#����w�	�?=�օ9J;�,�]-|��|������A�/2���/�ԫ�׶��WK�EϿNڵ���x�����o�S�I���֤׹�;�,�f�����[�u]�4�$x��RnRF�(``����Fع�5�Q7K��..��p��0�Ln�Q�F��,�s����9��F>k�y����Hȴ��$O�Z_~Ȧ璁��ؠ������s=�?��U����5�)؅�a+w�>�U6Ӹ'+GlV��A��� S)�z�j����}�6\� �_�t�M���:��ק�דK��N�(�g�f��,F�
���4�ɡ	@�1%���K�sr�����)�*�����Nw�hQ@����X�����y�PKY
G�����Q;]�Z5�b���'�x�G�h��ɪ�����H@�h8"Rt���x�g@R�7�x�����_O�6��Y"2�2�zL���e@��t��kkI����0� ��pUg�C�)��À�ʫU@���_uZɩ��82h.\�_PɁ�E����#�F3��u3�NM����m�}������ӓ���@n�w���@��z�B�S�L��D��9�u��	ٮ��:!9�r�V\��� b�|����h��|�e S��a�#�L�>6b�ѥK+�nH;�iȷ�����l2ݾ��Zo�~'����H�h!W����~�N_��Rv&�w��b(��UN�@�[�K�)�f�;�Oy:]�KI|s�]���#�~�C7Ս��c�L^k�2L>�7l]G2���S*�V��(�P2m�u_�ƽ�ǧ$&�0��R� ]t|�3)Z�[��&z@ү4M��{E�Ӎy����p�^�XY�0�3e*,t�cx
OUp+����k����@A˦��
B��ѐYW��(�N�¤\�H�h�Ϧe@�J��#��Ϊ��6�DAa��8x��2�'j�]Afc�
�?�*X��ő"�������@������97��a@�r�p�K)qݔ�P�@�~��g/��gm�n�����r�Uܞ��(���3�D�/-AM��rr�+e�Xӄ�H���d~q���C_ұE�հp=�'���0:W����� ��:������)\�&�h��K��N槂�@
��p]B��vWo$��&��B�c�S_K�_�-ղ���L�����V�ڴ.�2:<��W���x�~��l�Rd)$�X���u)g�[59Y* ���5�!!\,E���aAɤ6)囡D'�/�v����
c9R䅤%w��� �|�/���dT+}�x�	��"�d|���Ң�*=ҝ<��8�k�����0p��� �&ڪd:n�Qʑ���N��3��Y���|?&�v���Mj�C?���:m��k�?���ݢn�����4Uy�s��BW�2mW�A�*}�_�O�b���jS����/b����k9"�� W��T�s��4�������ɠ�ow#ߛ�!^�j�
%�ќ	|��L��d��:qt��Nn�ݗ�ѯ�����u�ӍO�Ψɥ������+���ɘ��7�I����0��p���N;%G�x8�v���Z�yҌ����g�*���D5��q�[8�슪���zNIt2aU�H��E�2�/�L�~>8� C#+��d��������Ҩ�tD5()sa��<>3y:��:P��9<�<��-�GЙ�({b��E��U�ءX�`͊�_ [G(����IR�)@�/���iy���B�<s.�fP"ӌh�������ML�5�v�?�Q����C}-�����gt���xo�@�D�_�J'����/v�?�X�m�-��S�
�
;����G�N��AWP�����M8�91�����*S��5;�T9��f]á<�Ԑ��k�������QyT�KT�&-۵`BZ��މ��f�2�������:�q2zdi��x�9�������g�r�S��;���D��Z�Y��^]v���)H$�g�<gR�[�/��q�]#(��W�m��,�3�����`%W�i\�� ��sl�Z/���Ʒ�S����)��V�i;�.P���1�c���3.�&�~�+��?H}��z_�� kQg����1>����v��XY�wnI�������ة����vo��o;��ơF]a��N-�,޾,��Яj���n�g�Z&��0�1�`������Ҽ���4�2MP{��[�(;�V��}�T����P)m3�?JVr����$1��Vs0ڄxV>M��6�d�B�*dΚafဲKӠ��1��C>������}4��g������EH��|�:.�q����Ԃ���kl7��<�z�m����87��d=��I�I��$�N�z����V��r�����K�M��K[b��|�
,e����"��E��)ȇ�ݻ`')��d��e#��|�ù��o";�S�AD'7E���k�r�Dp�dB�Ԉ�c��k�!	)�����{ ��p_������    �1x�UU@�Hж&��2�졋	����X,2�.t�1Du�dse�1�g���:�u>:f���L.�KBY<���e����˾��'(Lʑ�A�`?�!�	;I�עG\_ꎋ@�.��m�q2�..���%v���d���~r�2�����$��Ҿ� 2�z��QA���]�.��{g��kHF���Ɍl����kU��� ����p?���I�8����%xz�M�\8��$K��is��U%܆��ay^'ufK.��
�e.K�ܷ<ȗ˅�D2����o������RRA�s޸�j	 ���%��eF��t���樓�q��@>h��aС�M9���x����� � �-� �O�2�
�4��h�i�^�e�(�{K �m��B�ǽ�ˍ���=dk����5�r���h��tƅ#����c�I@��*�0v1��h��N�����uӜ)?X�:NU��?P����g0�<x��r1��f?����~�*��{=�k*�z$����>�l��A�!W�r�������Y8�=�X�/�47(��`Of�,��X����s��MN�9�S��&�3���v`1��͌��2���
��ѷ��=p�V�A�G�cY��4����� �M#)��M�9�/�7�f�C�$w֧x3W��܁G��� �8H
u����,�48���a��R�{�z�f�iJ�4k����X��t�B�2:�B�����yʳ^�8C��}�'Є!�e_5���wܸ\K�j&��6	[�y!�R��Z���J���e"�M>�'z{W��}�=}\ǓF�~��G` 0�l����f�~e7���A{2��+{|��J��l	A�\ۆZ�Hr���O��2)Ɣ�^��Y淣}t��Up��ܞ�K��kP�W�,�M�/Ѐ�s��28��/�+v��I74�Y_~B^��y����F.5i����v�}��u�e�{O�׉�#w,�6q̬z��L����Ȏ��r8�	��קc�^�}���1���s��\��^���m��qoa�,60[ں����%mG���1���2v���ޫ9#���\�}6��?>�@��Y	��`6�&�¾�w,�MG�^�Y��v$à6S�9@���5f���;�M��u���`�z��׺�����0Ĳ[n@�y��v�m�]]���|`p��?�T:öٛUo�k�U��8�w,�!8�*�5�%�	���,����8�p��9�ij����,��	(��DCi��*��DŶ�V�rmԔ���.93�A�����h���63��o���"�G8Os����Zn��x��f�*�6c�8c9�&��3��U�_#T{�&n�D�cVCGSM���bJn�ļFU�B�����2&�w�?4�������p$�}�7C�؛�sa��M-z����@ۺ�!�LH��:���]�������Fw�ӷ���e���u=Q�7�Y��8��'�ra<{&$k%�[Ƕ]y;M�B"�� �gq���֎�����) IV��$	�X���~I�/����Z��\�b�D�~��(1ϣL�r�S���0U�]-h�:]/��E�6���k��6s婒��s����)��o�1��F��,Ā�ϷԕxD@-r�(������$3���6���U�����HgG �$"���<�ջ	�����+���ٴha��Et(����>��h�<"�3/���!��Xqum�	wo��.�é�>tǷ���&���K�3��Ȣ�w��O�}���+nv�[-tt�Y��d���w[x�����P4At.�@ޒ�o,���9�ΙY���g	�	��l�սo��Q��{�εV�����<� �mƍ����>�ű%�[>�6Mh?e�5NPG꬯~��w��ύ�:
�擃�4�6
? j�sD�J��ת�V��_�xZL9te3���t��:�t��Z����L�RKz&��>W?5�z�0�U�zG�p���-d����=�$RĶ�Bq?�bT���>�TFru9�d�Zh�U�\���h�K U��{������+��v���H�0�V�|N=��۸�i��f�I+
'��$�IH:�����0��^=�gߪ<}8]���$5�S�e�(�8��3R$����p딦��E���j��RE�D�ַ��E����v��q��͝���L4Y)w��-�s�)���naOܞ��,a>��"�����Y~8 �H�d���Y�_/!�M8;���=��L�B��G~{��v�v!������8A�4�ɞ��h���58��,�������Hj XP��Z�}������t�>CR`T���0��P��#/#������)R�X[����Y�$���p�TS]�zm��^U�#�ުS�):���S`_�+Kϻ�C�S��j �� ��tiD%a��=:z�%)>х��/�2��-:eA�2�r`������G�x?l/�K�V�&����F+�����&���B︟� /�u#Gy�б�@����J������f��Y��f��*~;���Z�ͪ[S^�@/;��g��Iy�/�	^0m��K���J.iC��Y>z�5�m[�ScӢ���ظ�"��n����'�+��߱>��Ϻ<;��HK�yo2)꾛4�8<��eZ��ݼN����)oRE���l6eo�C��m͛Jc#LW�V�s)���h�Z������	]V��N�pZ�x��<�ͱ
a.Wa�M8��ˠ�m9�w���\_���6���̈́tNO V@/?Xo�LM����<��#ɵf�'/if[�M�m��Eî��>�
����΢�~�^^7�AMd��<].i%�"�����z �J��i&�7��Ѻ~P�j=(B�(Y�;�`��@XWV�=��Ҟ�Y��̥o��4��TU $���R8��o0��s��޷ �!w�ʖ6ST5%��|�A��ڛq��?
�Ez.0���V#��1y�������D0l�2��x�/3���#�,tE.��QfblB�ڑ�!0��a�V=6q̝�0�/f3 �vw�a2�'�EW�s���]u�*3M�S��EQt��m�3!a��B��+��у�R +U���\���w���a9�?7����,]-�`R�2�͠l\���Z{��Fe�T���I��Snmv(�<��;j�=�t\����4�뼮���n�֢3ȰD���4�$OUL/h�e��ǕkI�Ez�:&h��ה��@,�t��6�2��a�D�'����ծ���^g�9��'t7:���տ�j�����^bQ����FX��&�w-��ͧ����Y�?KK�7�qL7ܙOCau�� �aR�]
XS��\P���qEK��d���F6LO�m���t`�d��H�bα7Y�hC[%�p��)��o��g̢�}��,�tfMd��Q� m��ʺ��2 �����H�Ži�~T4�Q(�svJ��S����5=�����Eɡ�~4��̎��+m���ʿG���I� ���:dz�����t$`��Qh&��O@�/l-m��Xvۈ6ob�s��%m67%-x^�O$-�F+Q����l�^"e6���j!���4^)/���ƀ��ِ�9�y�d�X0p!=�ƚ\�.Ǵ̽���x�o���"����Ţ�pm6��LKȱ1�4�4Ԕ\������D悞)��GNK6,��wfٓ�Zx����.���<��
07�����E2�d�Lm\M�t�,��K�VT���$�<"M�V�qoMZ\hip8e���<e�RY���3�a��q�6��ܾ�Z:gTr�#�<k�g"4B�_�/y�ou���0��ܚH�`!VĈ�=CYA\���P
����CC`�L �d�]�G/�i41���Z#Ϛ��ጥ���A]i���y��%��U4�Xf��#匸�'lb�-�ȣ�-uS^�c�!`����FG���"�j�����\[���nJ�<\����#�^{���q�1À䛜ϟ�}��UYˬ9�/R%��BHH@�p�O���������7�H�Ұ��c�����E�t(�)�Oy�4h��P �  ې�f�LS���f�r��;���a��ӣ�t��@�Fߛ1��l�!8�����U�=�^Vsm��g�Տ����1�3m� �Wzg�L�JȠe5�/O�}K݅�z�&[0Q��)�i��~+�n�+<�W�+������⟰���|���U�N��)j?o ��<�~Oq]���릂�M's�]�)
���p�)�gA4�{����58�Di���,��!�ٺw�3[9ڰ�nh7�$M���|l��K؜���YlrL	�H�7��ӆH��$m���d�����>�A{1��E�\)���J'c3��&s�vZ�H�c�&4�qF
������S�!��9H�� �U:���k����;҇j�&GR��@�%�Ut�t#�Y|?$��z���\V����6�tz��1�\C?z!1����Y�����p�dL��'K���{X�NЇ���N�'��ȓ̤&L�w��M�E�w}��e��g��$��"[D���CuG�rN.j��9���5?�,��%���g�k����B���P�ޡ�E .�ڒ�I��$eHo���p*�J��l�BoD^R:��o��}�cl�ݻ�����[
c��޺���.Re
n���מ��/<`���ޭ��8/k�0# [��s����En7B�n[܈����U,������؏{[h�̚�$-����ŮXf3c�2!yb�D����-�ꉇ�VtE�Ԧ��`�#�I�6�?d�ۚ�}	�\̀��%ɞo/��H��7G�,�:	�	��bC:҇d{��r�����_�%�@�HI�Dݞ��<z�Zkr�!ppS��m(|
ߑ�gg��s�=�$�6Bf�W�]�,u{�6[�?��)��b_]�4��� �R����P�DU�x�\�|�'�\�!��b��j��1} ��F����|�o��r����K�k ���Xs�5��}��%L��H8�D_{Bj�UBäw-��ڕM�F���L�����0���IӶb�',��mJ7�������p0C
.4g$�U�s��`1-ׇP��0/�s�#|�:Y�On��_��\�K�23�V�yo���:��chE�YxGG�X1�$�B��u�Z�b�5�s�h�}�@��$�=�<bLP�� |�%Hr�:����㟐l��Ⱦ� ����h�އ��������0׺�� ���6�F��5�Π �{��BSyKV]iH��Son����À4�M@������v�Q��o*�,,�"�3��Ǩ釂@©JM�Pv�a�=B伀�j!�.I`��;�ƃyqP����'4tO,%,���� �O�+Y%�:T��2$4�2��F���1c�E�Mx�!"��]���E�l\C���!��G��AZe�q�՟j�ѥ^��E}�`=s�.�)-9U�j�0#1�y���-q#��bY�gR�jv+7�G��%2��z���y��ْ;we�L��γ�M�ڊ�k�!�j��t�kbVm����}���FGk�^�߾�P5 ��}>���	ZΑņP�����1|�O$�����yů�N�y���N��r��h���vi�T���g������t��Ie{�;_� 6c�R*Bi�a�J�l!�`~�N+��q�싌>�����{
7:�B?�uX�mȹ�si��vĭ}1�>3��0��H�z�rgs��6>7�	́C8�b�)��k �.� 4R�~<�t������?��]�8��4��ܪZ���Uc�M%���@�r����)��qh�g���hE4�g�4ãWdЀ0����1N��x��@�)�"5G�ak��{���0v[��E�Ѩ8\qT0w߳ҩe��2#�e���|Fs[�}*� $i7�O������`H��Dh?�©��V/=ح��;�r�c���{GlJWa�R5Xg�X�m�i�{����
�D�H�Q][vpC@�k����e2>�<�X���^$��v�n=��`�\�Zn�֬g�#~�+4ھ�,|06;�q�\m=�N�9���\�[t��6��pT�����T����}���!�v4�(23l�"%�,���r$Y�N�Sl��mVb��7��mB�_�]k5�Oԑ(�/��_�am3�}��>�7�/(���Pv.4h��eVp����� lv{t��9y���0乍qmwC��1@%�2,U:��??�,���.�Ei��kN�>����%qqu��x qu���$9�+��3����D���Dx��,8�0'��RA��XGG%1C@�D"g�/Y�7�!���2�I�c����iH�2�ڜ��1!LsuI
��rw�겠i�`�K�����SҴ��	��<�u��/�d��#NZ]�~�#ˋsN��m��;�._3����{�a�yQ'i>�~;� k�-��b2�ٹ1���5��jM�	�!	��c�I���g�L^Ӂ>�Ni��V_\����/-pAR��1��yˊa"@��4)�mWZcT�賖�͑)���I��,������u��fCzE6�j����0zq:p�0���p�Zf��h��&��0ھ?�vw�O"����+��9�K�bN��u����ؼ��jyU��Ҭ����?@O�I�Z%��.�I�,�o����������-�HJ�E��l]s�eZ	���>Z�3Gq�^7A��,��w3�C���Ӊ���!F}Z�mt���$�\dsk��_�N�G[Q��O�65��:P gm=&#
P�3����`$B�v�����lu��t�}0�ݺ%�{�<g�ww��O���*�>���dcEȫ�<	x�$'��ZuH./�V�}�#��ј�QHY?�:z�@
+�Uc�BK�5��CS���hy��M�'�A�O\��Zl|r���l���H�$�(3���T9�yR���6��m�� ڭ��j������w|'HG�+}�9��h��aĢ�PW��b�V�	�}(s����\�4�f);�R�X1[��T]A���3tSI��)G*ۂ6�)�N�w�ԁ'�UÂ�X2Y"�����/L�b2� �{�&��V�f%`�]��с�s�]~˝�ς1k	SXA�rv���B�.H��.ꏭ3���dLΊr,`P�[�]�P�N�,��#6���U?��;������q��s�@{����d�tD� D��p�l��(�����'ҐP�򲌑�4%(�g�u?��3z���Mxq-�af"F��,������j�y.DK�8$A�wNbF��~*���5~|�W*��G�s"m{���c 8�)T��l`�Xo��{lڛ�d��<��͌��i?�#GW�dč=����&I��x�<��|����mu�G���u�{�*d��aQC�(����gY]]¤��EƯ8�W��ZЅ	;$tZF��➐�K�/g��.�:<�����|g��Y�?=;ٕ��ᐌ����U��w/��,kf���W �쀑�wh�i�oi��y�!]g����u���Q��9����|�k�S���S�*r�h�2������|G�`�`���a:"Fɴ�p\��`��g��^�5����5')�&�}f�7)�ύ��M�E8���e�AB{�QI��=��p����#���i0E��\�I,�cH��J���LM���Yg{���9���K8���J8�ĭ���TB����V�FIˤ�ݪ��n�s�yj�c�t+��	b�O��`���yH"���\AZD�˞Z�6\� U�zt�L�N�m� ��#�1���\�/��h��_"[�Ț4I5�/7���D�:��l�mZ?�ͫ�%6;C�2���N(]>�$*��.!�Aw��ڢ�9����/o/Y�8�Ň���V0a�؉w�Y�)z��8�	�Q�E�?�M�Y�J��c
hu���?��s�#y�gi^� ơ�5��Va�d[ӂޭ�-6��\��5BE*�J�i^��n-2!!������˲[p����
-����=�/YF+��˗�.}��[ɫ˒��~e���d�~���� w������@�0�͒��?ư�@�tt=����^}�����>����;      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x��̱�  ���
�Z�Ѵ��7�.�=�L�{��p���p�i�S(�
u���n��7ڣ��8gƫ@��Rhe�����(w
[��Z��H�̹���"-y%�:8�0?��S�sJ��k�U�]���B|c�G�      z      x������ � �      ~      x������ � �      �   m  x��WKr7]�N�P,��#�;EJʮ�b����p �H�3%�|���Kec1ט��$y`�T�8����F�{���ys��󡹑��O��,Y��.u�	��*��d,�����`�N�(�]RL�%�8�%�,E�U�Q9K>4g���d�)/���N�M;�n���t�8������g�׳�t��b��v'���)�6�Ϊ��:y������x�B�si�K��g��4�G&�L#jnm�����ل]'��R8��<��|�ĝ�8�.��Y�,��^��1B�������/�~#_"�#�-rEP�΅~�����[ܸ�^��~���a�g�%v�yk��n�$��oϚ[n�������6�5�hHj�rN#�%�>�w�-9�32+���+||��+�>;�H+t��
O���S~x�����ҹ��.����%	0d>���1\+��V��b��ѱ@�q!�*�N����:*P��#�|�|�̊@~LJ�M�2H�1[��*= K���G���֫5�-o-��k��p��/��4L[I(J�"�I�͡-�?"��N�L�AmH��Y�FY"1:Aa+���eB���LĂ�3�f���⒙�V�2�#&GIQD��HH^d^�%�#�����iI��i�q�6�㬅������#5���DM��[&���$�E%	UeW:�/�'6[J�A���+u�,���Z��u��@�r$��RL>#A��ys;�s�zQ��6죕�g����B� �x�H}�8�R�����"}^*k�!�9i��j{�����\�9"�!�Us�:�S�67a$1M��$z:�:Q���c��+��^�/k��Ho�	� i͔�ג��b��֑(�~��r���B��gB�Y�BR����7��
h�L�L�M��:����Z&LR����ȰTl�4i�"��qI�谝�W����t��2�y"[j�C�Ќ/��V�P\�����&Y+��@���e�4S$�@�e	\�N�7Gp}Ѽ�̯i:�����.	�v�P�a�ԛ��b�=��ti�]�|�֊�����Ֆ+��yNF�4k�iW7��z>k���y�U�����Fh���:��jt��"�c�{�lJ�>yܬ��?S�'���-N� �����5qE;E���&��|���J��4$�,�-/� �;���"�l��݆J�x�m����'=�"bߒ��I�m%�u�C����h.�B���.â�$��]��0������򎷪>���|����M���+�=b-Cr�i��	p (!�G+�&�'A�q�0��w��������JC5<z�5b�$�-��1���/�8��/�'4�Г��D��V�<���WGF���������_㥅�      �      x��[ˎGv]��"v������-���!)B�8Zh�Ud��Q��J�Y{5;c6f��x��1˂d���������`/���]�����s�}��ы>Ս��Sg��iv�7Δ/fw�/����}�\Ӹ��¸8����hW��ѵ�ͺ�ſ���K��S~�>�O7�'�Y?ڮ�o.���4Ɔ�w�ok�`G^���ڍwKs��������8��Ǫ�������7���Tg�?��&9�F��K�Їqw�`ô��ح�xw׷��RĽc��g��M��v��d��}WGS��뾋K�t���b�h�+cH~������+�e8_��>,�W��X
}�ߺ�.����:k^�P[�� ����?��r��q�����t��D4؟�"�`����NxٹM�;�����wz�"��jh�m[g�l:��q�ԡ ���o=�V���e1�i���m�,������^��űM�Oź���7bܻ�I�o��3���S`u1#�h��Z�
���}c����';�-v��Ѽ���T}��x	�tf���7�g4��~��<a�?��\+6l`���BG9u5t
�H��@�+Īm��hh.t��0���U�{_�x���߸�r0���j��`q,�����6xe���6yn���K������P��B�;��x�&@�z��t���}�B`t8Íx�9��H���G\�)��ԨcT�rUpc,ۂt��r����uFuM��G��-x��	�|=�ڥ ~&2�!vg>i�ܿ�x5��f	�?r �V6)�oS��p��0��;w���1�z(/�컢K��|
�v��׍"�G��=,L2����<��U����"2X ��I���p���Mv���˨��� V�[Ȋf��yHn)x��z��\��EDG+@!65a�Y�:WL�ݽ�\Fd�W���s�uz�F4w���)a�I���`�4I���5��~Q�xi�M�.d[6�!��2sA�����~C��ѳs�D�D�0ۉX��b�Rh𥻂6�0�D���@�z�7u��
��w'�a�cP=z��K�3n�v�x�k�Px�:;�"�3[�����|�Qu`xJ~��p!�p�-M��3 �o�/��=�_5��ܪ{����!N�Y�F>�XC �0@P�(��m� ���f-R�_�;l�0������d��g��ۆ �cnZ����cG�\� C�e��?#�W�H
����h�	�/~����w y�u�t��ĸ�bEB�*@�^�n<������n�K�������1ǥPx�5X�(�MO�u.�H��Y@�z��P/�k8����.B.�a��H���`�ƨ��}�D����򾩭����nGTGرdIӛ��ǻ��ǚX����ƶڎ��t�Kx��@�01�
X��  8�`�>�Gŉ�W��c g�]ت}�N��d��r4�xh��xq x�@��Y��7 �v5|��8�0e����@p���ac3�wwQ���W��z���7"C[T��.:��+&,")|EL|�/�����%Z9� N��_�wAo���j��f��C��~�^1ubK9H�z9���
\�鴩��xQ�䧄35m��G278P�K2A��pi�y�Y:�^�)��B&�b���d���[��a�4d���4�p���{�+q3E���:��rH5x��ϦJK\�t��\S�4�ۼ!)BłBE���l�&&5Y70��)�h�u�����k���	�$} %�4�p�(��#��L��x\"#����������˔��\�
��5l��9��^��.o\i"�{5�$=�;�ǐ	՝�J��d`H�/����A���b�#<l��ԎiM�ȃ��2Q�5Yq��K��+�˖,�'٘�J$>�;�	��x�J)�l�ΤF��|���2Dpb<��bs�i�G	{����3����S���1��y���¶bmJPp���B4bQ��2�8��)��)R/Dy�xR��5��r��h�����w��l���%�\?J\Y�|��YA�Y}-��"�����y~�gW@G����ֵx�i|�0���蚨p9\'�q�?�#�'�&��7���^]���?ٕ���)��p��w��F�����ë_=yb.=��d��92�7��ɽ;w�:'�o}���,�Խy���7��^��3^�$:<�z�}���B��@Y��7�_���-�S��z�]2�o"�r�]���������7N�U&��� ��������30l�yV}�w��17r
)w,��Iw�X� GC�C�9�ҹ��/_��[7o�߼u|rל�yp��;��7�|v�����t�贲 �!�s搌��������u��Щݿ�o�����ӏ?�-����8*�{q�;�*B�)-?���q�pa<#�{�h�'�^����W�xlr�������'�9ǜ�����������&l@D����@4��!��݂�=�Vf��cV%e';#�Hh֘z'�F����N>���35�D��]�H~�d<���U᳌3#��6*v�
Xy��	�"nk���C�acWQ}h߀UA��0"�٫�0}�|�i�Uuuf>'�On/$�h%*�����u�M��	R�_��)� ��ꒈ��Z	 �» �b~���n�hBE\N̓Q���`^3�g(�+�u�Ą~��je�؊�?Ua�4�mSR3���R,���^;صbHr���hA�7T��%yRU�7�	��$���U�m5�#nܾ� }1`���60�LFg��Kbӫ� 2�b�Ҧ���$�Kl��u�8��<���/E�n�B�{�"ts�0�ƂP���-���O�g ����^;�O���P�����TaK��K�w*t,�x�o^���e*�>�<~GO���9|˪@�w�n�ϙ�IQj`�]|Gbn+s��Y��c��H4����nR�<S�d^��K�sS[3���AbũM��zuh��j����svk������9(�-Ӏ�r� j��� K�Ī���[��1�mw�
ڼ։���AsD<�)�Z�䭛x<$&��rM��D�YP�4�N�B���v	KG�->z�G�9U�%7�C�Y+���{�Z68@��ٺ�#$�2���5\�s�A����|���=7 In:Hc��ҿ��O�n8e3�A{�D�ϓ۷�*�cŨD�\d�b��+�0C�3�^�zk��e�^�	|����Ĵ���3��8�5$��ܰO&����JA^!o��D|�C��$.ޡ�6z��8��U69A������!�{���ц7P���k|osf(���G��`�����;�:�<xV-5~�#P=Wt�Qf�Z��w�z�\ꑰ�N"���1]�:��D#��8,��M�����A}��q!=fz��b���Z��A�pI��V��j���4�ƋW�|{��} ��%�W|�>̦����3ۮzfpN�d$&8��V���X��<�ö� !5�����c�8�{0�j�5*�+8PSMZ�$�L������ ��(H6	�?���L�Tr��
�}�Rke'�M��C"z�)�/�B;�W���j� �ʑ�!�B��c����&r��FZ),9�W�xM���:Z�4\&	R���(�9U�o�f��/�BI;2��	�����i�-2���Bl*�)���Of��w�J�I+���6B$v�5����� WP[��h��P ��{�UB���إ��zW�ˇN+Zs���o�H/k� ��;�����O~�ލ|Db�h`�������+��$�[��Y����Y���YԜ�V,2������4b�%��jX9���$�����#@�1G<��$x�c����K�3�����j�4�����q���f3$��)Vɯ��[ǐ%xw�&-� �9�VR�.���1����v't9�eb;�(�K)�+;.4A��
0_��q�yQ8{�ǕW��{7Hƥ��捘�$�T�X=HTN*A�3uN�m�_� �̅�x,��6Kj��5k��/����y�K��]�{>S+M1�2 �	  `�����o��Qb@�Ɩ�h�%:9� � ������A�B�#���FZ��ˋ�U�D���-B���|�im���3�D��J�E��Oq���ȼE��B��٤mZX�d+��޻��YA0��H�M/�)�^�s�o��.9�AItm"�xҢ4��3��/��A@^��b:%�:$j�>wN)�Ơ$�����y\�
��AJ_�%Am�F��ρ�G"�r="
]$L�2�7�8�$'C���NG̋��9�|����m��R�(������p���{�j��uǬH��rr��-a ���-�D������f.����}���GnKRJXЎR~[<,JK�x�BI �/ˀDŴ��}����w��A�M��N�	/��
Q�w~,�I6p�)��ݹ���D'wfe�\�>�cD%>�/t�� ���J�b�	x�4W��^%�V���rY��3��e��H��2���i�^�t��Oj���>:��%�*���m�NR�嚆�JD!$��&�_��88�f�6(�R��2��SLM���(1�)�"+��n�YHY�[%��~����M����{���r$M�����%i<�lR�e�M�S���Y(W+��̌_
+�I���=g��.��eף�"��an�Mѕ#F���`��!����i[:7�9�uPW���4��w�^�t�3���V�������%��xQ�T3^�s(���v_
��c#9f���`>�?='�����O��nsa�sF I��^+�h� ܻ9Z��d�.��R
i=q�yG��|Ӝ���Eҡ���� j��!�b��lt���\�=�|�
Ք i1�r��gJ��Pְ˷w~u��U`v�<�<o�r�7X��}�&;/WK+7X��-��扞KOɮ�^���'G����0�w�Ps���G��Τ�baR̬���~����֏�~�D�J��ŧMZ�e�A�,R��>�i76�j���~r�������,� ;%Ά��"��	V�-�6m��yT^���d�c
1�`���'=���lAIb�@�(S��	~q�V�Z�X�V�$�/
[e���u}ɴ��dA�>e ��6���� y4ٸ:.'��c�^�������z���2�RA�b"[���B�Z��Eͳ���nąm��Z)���LA�$%2��\I��^��}���-KK1�E9y���Sr� ��� ��J�W����	xV}f+/A�0����Y��{�S5�+B&�2p�-UxR{f�\8��NV E�j>�T���L�sZ�9�k-.4y�˚�~%	5����7��e8��d�ŀ�ӟG�l+I���lE�8+RD���)�vd2���KųN-{�p�w���[��ymD"����bk62r?���e�c�/=4���~�ߌ���ͥ�Dh4����G�̏�:cLZ���ui��#k���a$/Si�G<^�9����Q.yZ��5�
�0,���:�eD�t���<��J�DJ�����~9KL��z�����ic�K����JR_g�Ȝ��k���	�f�]Ag>��:�sgk�8�~�ׄ�N��h���1�����C)U(�gXS�I�z������^����-�#e>b����<�v*C�k-�i�W�uJ�[�#�j��o'�ƚ�9�P����&���-P�$Ś��Lea>���%X@k��moS�u��0~��L�pfO�	�E�ڳo]�����IO����zW2M~%�n�l� ��R-�[2j�pl�m��;����	)��As�~-E<��G�y��\I�[% 	��Ƴ+���7��0k@bc�+m�n{��r���	�&f"��9���������ԙ��\~c�Y�~�1�jb�:f�!A��,��*[&7> :0�(u+�"����4a[&��A��M?�(��04)Q�d�EMn`T�&��t�G��C�bC��'C��S(ːs�Gp0��Ǹ�3�N-����s/�Z .D+��f��H����DAdٯR�D��ڲ�u�u�K\je�I�ˢ����@	��P��ܓP������Ybv���!h�� !�
c����1��<�9V�f����R���$�>9��(�"
pVs��ށە6�䍽�Ŭ�e9\���cE��e����A�E$NRj|k��|��`������R2LC�=�bj�	r	�*5�wS�S
���9+�_S�,��֥�9�N����}��GZ=̔�K�n9V�l�`�zꅵ��0�ͺX���*ϽM_�a)�Ȧ)R
����J����K<k_��A;�N���X��I/�3g�����<k�����2�ie`U
��s�{���r;��0��.r�M~ZҮ�<ͷ��ގƆgjA�]0�?�zJ�ITP��f0��c[ڌ�_Ӟ����Pڟ�l�W�3���2`���:�ŗM ��O`���f��3�.�W>�ڱ���`c��O�
J�z_�e��������_k�s��S��c�W���y����En?���孓�wO�s��}��� -dN�      �      x������ � �      �     x��Z͒ܶ>SOݤ����J�,��+EVee)R_|���8 A�gj7��H��9���^��9?+3U���;C@w���͝W�u�mu���.h���R◨E�\��h�A;�D�]���6�yܭÙ����-�(:ۊF	��;�o^�;��8����{����b����W��b�����gO�.����^�ꃋ�re���NՈ�2�GB\v+s&ď2(��;�Wݭħ^#��Tu�ZvA�:cs� V�5��I��	������~��+��;��3�m���х��n�R,�*�ԙ�����{�Պ�@.�Sl�����Q�6�^��V���m����]��k�H�����+�58��X�k4v�d�l�A�w�i簳I~R]���u���J���!��Fm��W��茭Ǿ��+i���De�w��e0(/�b����~/$�WwQ6n\�h_���|����m�(���>9����8��<�IO�˶7z�kb{��ne�*��Fl8���!��x�L���ҥ�����ZK��>����Y�ɱ�9ݼHz4>�N�2��㋱iS��tXQ"�c+���rZ26@�mt�)���C��%S�a�Z"r�'[�Y�W����k��+ޥu���K�V�$����m�%Z .��H��Ǩ�ٮC�}�N�߁:QKO���1L���շ�]H��j,���I�|�[E��7���h�8���쁯<q&�������,z��-�!n�A/�o�'��Aٱ]�xŞ`�\F<9�S��ѦQ�ފkp�@ 9�QV����l�XY��P�i�?E�4�? .a�[���#�2R�]0��Z��!EO�j~^]�n�X���[G��ȑ�+�V�M���:�Õ@��?�� }��v�Ri���+�ZY�w��\� �d0�{gTM��	�(RX�W�^x�n�K�s�i�Ϋ�7=ֵ�vp�;&�X��c���]�h�N�~\eqoYc����@57�4����\)a'�om�F�ٴJ��U��=pq	�6�g� 8�O�P��b?�z׈��<�J�B�X��* S�)
 �ra>��R_�=u&)��W �{���1�8�DHNC%u���E� .�1��, c$�-2����-�i'����z�B��WՎ����x�>фXG?��O�Q#�m�r�.���F�rD����{�,�N/�H
%��$����b(Hw��{�n^���LG�òH
���k�;o��-,��؅��Ȉ���a~|蛉t��F�l�. Dg�Z�踱�> ؽ�O��~Pdy��Ht��Ael{�hi8�;�)o��a�j�fGx�Q�KT>�/N3�)�a��>����G߫,]����`���| Ȭ�
�?e�s���-4�L}!�l|���?���ߵ�vIv,�kT�5֥���ڶ-��q�cņ�7K���m�a�~H	���vx)>b%b��W�>��y��XLF���;C��Zd ���rT�p�}�:h[r�V��_W(�����ǜ?m���k�%fU�3J�z�9>�X��h�$�z"?���KT�7���hA����0�B�4 c�񃍍���q�%zh��p�s��a��r ���gq���3�%���#����h�'�Ϡ�i�~^]�����}�Ic��p���Ĕ�F��%0�ٗ�&)�|�,3gY~����%�hc�,�#�����\=v���/���m4V'�Aq!뻨�DS}oo������w�Q��7�� ƭ��7n2F�N��y/��u$~T�;}�D�H�\��F���
���Q�KӞ��6��2�"ܒ��-��P�N����M-�3ִ�\�W��ꎎ�g���K�y [�6�U�٧X��RIfu���y���ـ5w\&gB.u�¢Yi����F��f������Ap��L�zR S�?G�$���qyT��gV�nTFgL�Q�:5�4ґEf%=����2�&�P�HJ�Z�2<oLH�*?�2��K�92�l��թ���=}\fB����	� ���?� �7�����֞b5PYO:
f/`j� ˙[.q��f�]J0�W��+�ǡ��~���>)!t�]Q�N�P�Ц�����?\ۀI�VA=�_y��d��@�������Vaġ_k�o�5���'������<[�O�%�(M��a4x0zf��n�6�jd�J�j'hZ��l=�u���	�[(�AD�0��K�Z�}U���rXىit,T��^�[E�V0~R�É�S�#E�(5P3���ejkWZ6�^�ֹ��M����Ԗ�v��#QH�6�{t.��Dd�ޱ�4����á��-(�1�k���Vѭt*X)P������6H`F��N���̟�R�}2�N�R�,��A��F �1��
V\[���n)�(���Pf�T���k���K�q�� F&��)@��o�-@M���oˠa��?�A�������i0�������,-\r/���kR�a�IѭIG�E���9:E�c�k�ma���9'��|�`�1��n��:�|��bx_A� ��	$ ��ٯo=W�����qyV�i��}�����\���1S�n
��+O����}֭_�bl�� h��]�o�3`�F�U4���t8�(:��eK�3��_WU���m��qg3zÐ �iAn)7(|�7��nŏJz�nF��u���.�3�i������j�+L��y�)�^-��q+�qd�o
˻�=�O�kGm<%'(/v�$��j������rDa2��0��iK~@y���	\@�τ)�|��4#����䜂���}Y����8�$
C�XXsQ���1�u���%#G�L���*���~��
Ȣ1?��?�����s��I��/'����=�����Rv��.#%��j��QF @k0�"�c����c�vR��&1�e	��2�=Z�^z�`��Ç_|��.7��⏪�'�=��F�W��Qu�^�A���
�U�����2d$/M55B0w���i��4���sy�J}��(w�Q*�3�5ޓ�ǿ�P��oGx�r�К^\�*���<�F�y���0x��?������ޑ���eg�X��D��ړ�l�`�#��Q\��L��<�At�#���V:�)ͧrvҍK�3��$���"D�̍Xo��mz��*DO��_6l�
���Rcb��<�܉Y�|Eｾ�_�_Ôp�	��j���������p]�Y��V�$�:X�з��;ȸ�|��w^�Y@�4	���*(]ppr#�o҃��{ C��N��9�?��h��4Q�?i��G�xO��Og<�/�B�A      �      x������ � �     