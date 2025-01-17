PGDMP                       |           final-project    16.3    16.3 _    \           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ]           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ^           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            _           1262    16406    final-project    DATABASE     �   CREATE DATABASE "final-project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "final-project";
                postgres    false            �            1259    16677    Order    TABLE     �  CREATE TABLE public."Order" (
    order_id integer NOT NULL,
    customer_id integer,
    order_date timestamp without time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    status character varying(20) NOT NULL,
    CONSTRAINT "Order_status_check" CHECK (((status)::text = ANY ((ARRAY['Pending'::character varying, 'Shipped'::character varying, 'Delivered'::character varying, 'Cancelled'::character varying])::text[])))
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �            1259    16676    Order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Order_order_id_seq";
       public          postgres    false    229            `           0    0    Order_order_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Order_order_id_seq" OWNED BY public."Order".order_id;
          public          postgres    false    228            �            1259    16707    Return    TABLE     �   CREATE TABLE public."Return" (
    return_id integer NOT NULL,
    order_item_id integer,
    return_date timestamp without time zone NOT NULL,
    reason text
);
    DROP TABLE public."Return";
       public         heap    postgres    false            �            1259    16706    Return_return_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Return_return_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Return_return_id_seq";
       public          postgres    false    233            a           0    0    Return_return_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Return_return_id_seq" OWNED BY public."Return".return_id;
          public          postgres    false    232            �            1259    16617    category    TABLE     m   CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16616    category_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.category_category_id_seq;
       public          postgres    false    220            b           0    0    category_category_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;
          public          postgres    false    219            �            1259    16597    customer    TABLE     B  CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    email_address character varying(255) NOT NULL,
    last_login_time timestamp without time zone,
    password character varying(255) NOT NULL,
    address text,
    telephone_number character varying(15)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16596    customer_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customer_customer_id_seq;
       public          postgres    false    216            c           0    0    customer_customer_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;
          public          postgres    false    215            �            1259    16690 	   orderitem    TABLE     �   CREATE TABLE public.orderitem (
    order_item_id integer NOT NULL,
    order_id integer,
    variant_id integer,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL
);
    DROP TABLE public.orderitem;
       public         heap    postgres    false            �            1259    16689    orderitem_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderitem_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.orderitem_order_item_id_seq;
       public          postgres    false    231            d           0    0    orderitem_order_item_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.orderitem_order_item_id_seq OWNED BY public.orderitem.order_item_id;
          public          postgres    false    230            �            1259    16631    product    TABLE     �   CREATE TABLE public.product (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    supplier_id integer,
    product_description text,
    price numeric(10,2) NOT NULL,
    category_id integer,
    image_url text
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16630    product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.product_product_id_seq;
       public          postgres    false    224            e           0    0    product_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;
          public          postgres    false    223            �            1259    16649 
   producttag    TABLE     a   CREATE TABLE public.producttag (
    product_id integer NOT NULL,
    tag_id integer NOT NULL
);
    DROP TABLE public.producttag;
       public         heap    postgres    false            �            1259    16665    productvariant    TABLE     �   CREATE TABLE public.productvariant (
    variant_id integer NOT NULL,
    product_id integer,
    size character varying(50),
    color character varying(50),
    in_stock_quantity integer NOT NULL
);
 "   DROP TABLE public.productvariant;
       public         heap    postgres    false            �            1259    16664    productvariant_variant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productvariant_variant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.productvariant_variant_id_seq;
       public          postgres    false    227            f           0    0    productvariant_variant_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.productvariant_variant_id_seq OWNED BY public.productvariant.variant_id;
          public          postgres    false    226            �            1259    16721    review    TABLE       CREATE TABLE public.review (
    review_id integer NOT NULL,
    customer_id integer,
    product_id integer,
    rating integer,
    comment text,
    review_date timestamp without time zone NOT NULL,
    CONSTRAINT review_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);
    DROP TABLE public.review;
       public         heap    postgres    false            �            1259    16720    review_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.review_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.review_review_id_seq;
       public          postgres    false    235            g           0    0    review_review_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.review_review_id_seq OWNED BY public.review.review_id;
          public          postgres    false    234            �            1259    16608    supplier    TABLE     �   CREATE TABLE public.supplier (
    supplier_id integer NOT NULL,
    name character varying(255) NOT NULL,
    address text NOT NULL,
    website character varying(255),
    telephone character varying(15)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            �            1259    16607    supplier_supplier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.supplier_supplier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.supplier_supplier_id_seq;
       public          postgres    false    218            h           0    0    supplier_supplier_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.supplier_supplier_id_seq OWNED BY public.supplier.supplier_id;
          public          postgres    false    217            �            1259    16624    tag    TABLE     c   CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.tag;
       public         heap    postgres    false            �            1259    16623    tag_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tag_tag_id_seq;
       public          postgres    false    222            i           0    0    tag_tag_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;
          public          postgres    false    221            �           2604    16680    Order order_id    DEFAULT     t   ALTER TABLE ONLY public."Order" ALTER COLUMN order_id SET DEFAULT nextval('public."Order_order_id_seq"'::regclass);
 ?   ALTER TABLE public."Order" ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    16710    Return return_id    DEFAULT     x   ALTER TABLE ONLY public."Return" ALTER COLUMN return_id SET DEFAULT nextval('public."Return_return_id_seq"'::regclass);
 A   ALTER TABLE public."Return" ALTER COLUMN return_id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    16620    category category_id    DEFAULT     |   ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);
 C   ALTER TABLE public.category ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    16600    customer customer_id    DEFAULT     |   ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);
 C   ALTER TABLE public.customer ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16693    orderitem order_item_id    DEFAULT     �   ALTER TABLE ONLY public.orderitem ALTER COLUMN order_item_id SET DEFAULT nextval('public.orderitem_order_item_id_seq'::regclass);
 F   ALTER TABLE public.orderitem ALTER COLUMN order_item_id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    16634    product product_id    DEFAULT     x   ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);
 A   ALTER TABLE public.product ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16668    productvariant variant_id    DEFAULT     �   ALTER TABLE ONLY public.productvariant ALTER COLUMN variant_id SET DEFAULT nextval('public.productvariant_variant_id_seq'::regclass);
 H   ALTER TABLE public.productvariant ALTER COLUMN variant_id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    16724    review review_id    DEFAULT     t   ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('public.review_review_id_seq'::regclass);
 ?   ALTER TABLE public.review ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    16611    supplier supplier_id    DEFAULT     |   ALTER TABLE ONLY public.supplier ALTER COLUMN supplier_id SET DEFAULT nextval('public.supplier_supplier_id_seq'::regclass);
 C   ALTER TABLE public.supplier ALTER COLUMN supplier_id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    16627 
   tag tag_id    DEFAULT     h   ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);
 9   ALTER TABLE public.tag ALTER COLUMN tag_id DROP DEFAULT;
       public          postgres    false    221    222    222            S          0    16677    Order 
   TABLE DATA           Z   COPY public."Order" (order_id, customer_id, order_date, total_amount, status) FROM stdin;
    public          postgres    false    229   �p       W          0    16707    Return 
   TABLE DATA           Q   COPY public."Return" (return_id, order_item_id, return_date, reason) FROM stdin;
    public          postgres    false    233   /r       J          0    16617    category 
   TABLE DATA           5   COPY public.category (category_id, name) FROM stdin;
    public          postgres    false    220   �s       F          0    16597    customer 
   TABLE DATA              COPY public.customer (customer_id, full_name, email_address, last_login_time, password, address, telephone_number) FROM stdin;
    public          postgres    false    216   �s       U          0    16690 	   orderitem 
   TABLE DATA           Y   COPY public.orderitem (order_item_id, order_id, variant_id, quantity, price) FROM stdin;
    public          postgres    false    231   eu       N          0    16631    product 
   TABLE DATA           t   COPY public.product (product_id, name, supplier_id, product_description, price, category_id, image_url) FROM stdin;
    public          postgres    false    224   �w       O          0    16649 
   producttag 
   TABLE DATA           8   COPY public.producttag (product_id, tag_id) FROM stdin;
    public          postgres    false    225   cy       Q          0    16665    productvariant 
   TABLE DATA           `   COPY public.productvariant (variant_id, product_id, size, color, in_stock_quantity) FROM stdin;
    public          postgres    false    227   >z       Y          0    16721    review 
   TABLE DATA           b   COPY public.review (review_id, customer_id, product_id, rating, comment, review_date) FROM stdin;
    public          postgres    false    235   �{       H          0    16608    supplier 
   TABLE DATA           R   COPY public.supplier (supplier_id, name, address, website, telephone) FROM stdin;
    public          postgres    false    218   �}       L          0    16624    tag 
   TABLE DATA           +   COPY public.tag (tag_id, name) FROM stdin;
    public          postgres    false    222   ~       j           0    0    Order_order_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Order_order_id_seq"', 120, true);
          public          postgres    false    228            k           0    0    Return_return_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Return_return_id_seq"', 30, true);
          public          postgres    false    232            l           0    0    category_category_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.category_category_id_seq', 5, true);
          public          postgres    false    219            m           0    0    customer_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customer_customer_id_seq', 20, true);
          public          postgres    false    215            n           0    0    orderitem_order_item_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.orderitem_order_item_id_seq', 91, true);
          public          postgres    false    230            o           0    0    product_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.product_product_id_seq', 30, true);
          public          postgres    false    223            p           0    0    productvariant_variant_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.productvariant_variant_id_seq', 90, true);
          public          postgres    false    226            q           0    0    review_review_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.review_review_id_seq', 25, true);
          public          postgres    false    234            r           0    0    supplier_supplier_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.supplier_supplier_id_seq', 5, true);
          public          postgres    false    217            s           0    0    tag_tag_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tag_tag_id_seq', 20, true);
          public          postgres    false    221            �           2606    16683    Order Order_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (order_id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    229            �           2606    16714    Return Return_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public."Return"
    ADD CONSTRAINT "Return_pkey" PRIMARY KEY (return_id);
 @   ALTER TABLE ONLY public."Return" DROP CONSTRAINT "Return_pkey";
       public            postgres    false    233            �           2606    16622    category category_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    220            �           2606    16606 #   customer customer_email_address_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_email_address_key UNIQUE (email_address);
 M   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_email_address_key;
       public            postgres    false    216            �           2606    16604    customer customer_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    216            �           2606    16695    orderitem orderitem_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_pkey PRIMARY KEY (order_item_id);
 B   ALTER TABLE ONLY public.orderitem DROP CONSTRAINT orderitem_pkey;
       public            postgres    false    231            �           2606    16638    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    224            �           2606    16653    producttag producttag_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.producttag
    ADD CONSTRAINT producttag_pkey PRIMARY KEY (product_id, tag_id);
 D   ALTER TABLE ONLY public.producttag DROP CONSTRAINT producttag_pkey;
       public            postgres    false    225    225            �           2606    16670 "   productvariant productvariant_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.productvariant
    ADD CONSTRAINT productvariant_pkey PRIMARY KEY (variant_id);
 L   ALTER TABLE ONLY public.productvariant DROP CONSTRAINT productvariant_pkey;
       public            postgres    false    227            �           2606    16729    review review_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);
 <   ALTER TABLE ONLY public.review DROP CONSTRAINT review_pkey;
       public            postgres    false    235            �           2606    16615    supplier supplier_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplier_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    218            �           2606    16629    tag tag_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    222            �           1259    16890    idx_category_name    INDEX     F   CREATE INDEX idx_category_name ON public.category USING btree (name);
 %   DROP INDEX public.idx_category_name;
       public            postgres    false    220            �           1259    16886    idx_customer_email    INDEX     P   CREATE INDEX idx_customer_email ON public.customer USING btree (email_address);
 &   DROP INDEX public.idx_customer_email;
       public            postgres    false    216            �           1259    16888    idx_order_date    INDEX     H   CREATE INDEX idx_order_date ON public."Order" USING btree (order_date);
 "   DROP INDEX public.idx_order_date;
       public            postgres    false    229            �           1259    16887    idx_product_name    INDEX     D   CREATE INDEX idx_product_name ON public.product USING btree (name);
 $   DROP INDEX public.idx_product_name;
       public            postgres    false    224            �           1259    16889    idx_supplier_name    INDEX     F   CREATE INDEX idx_supplier_name ON public.supplier USING btree (name);
 %   DROP INDEX public.idx_supplier_name;
       public            postgres    false    218            �           1259    16891    idx_tag_name    INDEX     <   CREATE INDEX idx_tag_name ON public.tag USING btree (name);
     DROP INDEX public.idx_tag_name;
       public            postgres    false    222            �           2606    16684    Order Order_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 J   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_customer_id_fkey";
       public          postgres    false    216    4752    229            �           2606    16715     Return Return_order_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Return"
    ADD CONSTRAINT "Return_order_item_id_fkey" FOREIGN KEY (order_item_id) REFERENCES public.orderitem(order_item_id);
 N   ALTER TABLE ONLY public."Return" DROP CONSTRAINT "Return_order_item_id_fkey";
       public          postgres    false    4774    233    231            �           2606    16696 !   orderitem orderitem_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."Order"(order_id);
 K   ALTER TABLE ONLY public.orderitem DROP CONSTRAINT orderitem_order_id_fkey;
       public          postgres    false    4771    229    231            �           2606    16701 #   orderitem orderitem_variant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitem
    ADD CONSTRAINT orderitem_variant_id_fkey FOREIGN KEY (variant_id) REFERENCES public.productvariant(variant_id);
 M   ALTER TABLE ONLY public.orderitem DROP CONSTRAINT orderitem_variant_id_fkey;
       public          postgres    false    227    4769    231            �           2606    16644     product product_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_category_id_fkey;
       public          postgres    false    220    4758    224            �           2606    16639     product product_supplier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES public.supplier(supplier_id);
 J   ALTER TABLE ONLY public.product DROP CONSTRAINT product_supplier_id_fkey;
       public          postgres    false    218    224    4756            �           2606    16654 %   producttag producttag_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producttag
    ADD CONSTRAINT producttag_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 O   ALTER TABLE ONLY public.producttag DROP CONSTRAINT producttag_product_id_fkey;
       public          postgres    false    224    225    4765            �           2606    16659 !   producttag producttag_tag_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.producttag
    ADD CONSTRAINT producttag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(tag_id);
 K   ALTER TABLE ONLY public.producttag DROP CONSTRAINT producttag_tag_id_fkey;
       public          postgres    false    4762    225    222            �           2606    16671 -   productvariant productvariant_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productvariant
    ADD CONSTRAINT productvariant_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 W   ALTER TABLE ONLY public.productvariant DROP CONSTRAINT productvariant_product_id_fkey;
       public          postgres    false    227    224    4765            �           2606    16730    review review_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);
 H   ALTER TABLE ONLY public.review DROP CONSTRAINT review_customer_id_fkey;
       public          postgres    false    4752    235    216            �           2606    16735    review review_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 G   ALTER TABLE ONLY public.review DROP CONSTRAINT review_product_id_fkey;
       public          postgres    false    224    235    4765            S   �  x�e��JC1E�y_���L�I�V?@p�F�C�~�i�Νy�U9���tN�����X��'q����z>ϟK�$�	pcr#�~/������qٸ?�y=��+XR1��ʍ|z?��ӕ��Y��7�I�S�Wl���_v�=u#;�-:�4����w���L
;�1�X�0-��73�H�9��a�#����0�d�uf0��=5�b�{�l��F��g�u�D�x�1S�J�|}�$�Re��d�ى2�"Uu�L� �D5N�	7$I㆘pD��O\�@$��g$����w$���'I Skޓݒ2D��E�M)C���)Ö��îQ�aL�nb��:�?�T����8☘����8☘����HD-���H%�Z'���6{H��:r��~Y�_��jJ      W   d  x����J�0��듧�L�����"�x�7]��֌������r�'9ɏ@ �i���E�eח%/��[;t�Ψ(er[�km7���%g��ݧ�{L!��ͣm=��M�6�5��K�O�u!��9�C7���3KY2]2}�Gw�w.��JV�V��O��϶�l�o�Z�����omm7n]���5�TR1����~��S��A&q�������5������x}@@���)�� !�B@L٠P�:X
胤V
aJk�0g�J@%�����7�y%�DT��߉DTҔ�F"*iBI#�tJI#�tZI#�4����J:����J:����J�V�3ɩ��+�^c� 5u2�      J   -   x�3�tN,IM�/�T0�2Bp���c.Ǆ��1����� ݜ�      F   u  x�u�;jCA���j�@���*!�Hc�����&$ˏa�0F�B�~�|X޾���y����W��?���c�/�����>;���r=l���v��z:��m�_�BL�Ԧb�Z��[�T�^5V!��Ы���T�X5���^�n5L�ث�� ��ԫɭƩ�z5�%��{5��4Us�fV�VK����j���j��j���V�T��ZY-�Xm���j���W�U��u�m����L7��@�5f�dT�*����B�(���@lp�٬�zS�@qp��L4�� ԁ��Ӈ�	��Q0�������>��&��W��A��A͂!�.C��A�Z�D�"\�:[1�����ը�F�F�Fm��_ò��      U   ^  x�U�kn�0�ߓ���%ݥ�?G���"�������mw���?�����9:�1�|3&�ħ9c�u+|Z36���=��x���q|��͸g��,%�jh�m�Ұ�'��I��H�c��J���r�-��I��H��mÊ�-�~��yTzV0_�
��gOB��<O��_����$4�OLB���=�Z��̧&���|�>�#���ϛ����/t�÷I���۞���2���f���f���^���2{NB���0�9�.��$�Df����2;̅�6�N�n1	���9�$4��s[�2�OBs|NoL2�W��V$2GMBs�=	�F�0?�C�x��y3�j@��qâh+���R'���b�+�;�N��!<?o^*�<%�RDz��x��-iO��*">�O�W��IJ�kM��"�ӸaQtQ_��e��(�+Q_��mܰ(*E��/�qâ�*������M�x��<�-}�D�qâ�(���o�Q8M}Kߡ�����F	qâ�������F1���}Q��7�(+nXԓk�K�����WK�3���ٝ(�oSOu֯�f+��m��C��k�
��2�����Zu\!�[lZ?����g�����������      N   �  x�}�Kn�@����)8r��5� ��"�R"�O���׿ˋ֧ay>�.�����o:��ǟ���imۚ}q9}��������кV�õ�e���P�u-���ڲ�w�~]��������u�a]ex��������q]����2W1��)��T��j�u='W��\mF[�-�Z+-�Z;��%w��.�;������Ag�̝EF�(��1�g�?V�2h��A��+d��"#�@����5F9��H��Hr%3����Lf4-2���Ne:-*ҩr��tZT�S�&�<��h1|�Ne:-*ҩ
�Ne:-*ҩr��tZT�S�:�鴨H�F�u*�y��NM��T�Ӣ"��!שL�EE:�P]g�tZ�����e�-�_9      O   �   x�����@�b�����zy��q$a�,�AEex+�wx7W<^�&w�'��<QK���u�'t��!��+������pz8=�����\�ҼseA�7kI"�ɷ[���u�"��g�6�	|�{�=�ں����ƺ��t�ԁ�'@`4Ws6u��A�tp;8\�����pC8"\Q�	u�BB%��PK(�R̥��1��>�A      Q     x�]�1n1Dњ:EN��(QuڤJ�#0���\x�>{�	c�nn����}���yo���a��	�|´�۲��H� �<m^�vlj%R� �x��w�t|@$��BK� ��hk�.��VB�u�߮C�5"�1,�5&DZcA�5�nim��D[�o��%Imv��&�[v1I�1IR�˼�cI����c^62���K�5��2��$)�A����e+k�����E\_�I�I�"�/��N�b8I����hb���$���e7�IZ<$-&>(�K��y'Iq����=HRܓ$ō�JY��7I��FY�N�/I�ח�'I����p}Y�Y$)� iח�C�b�����r����N�b⃲��$)�"I1q}YNn�I�x����%I�v��[k���b      Y   �  x�e�Mo�0��̯PO;u0i;������e�fa��r���IQ��$C���O����WGg���7@U��+U�.YĪ�����2��T	��N�tϙ�d��X[�U�X�+�E�j����ΙfȟB��b��Ş�SF����Ī�c�_5�e����O�ͤ�/}�T���J�����߳:ؑ_gxN�]g&}<Z3z3���R�b.�����Y9n�����[�A��
>���I�ؗЃ%�<�3� �#� ����C���'!��x�j�i��p	)5�5�f�a�����i��W�R���x~i��A\CJ	��ɿ�HB"n ���2_���-��H� <�^Y��+�$R<.�
��GvM��M]�*zۚ���_F�9���*N.���r^Q���W�<S)�Q�1�ڶ.6Z?�ҽ6c~ ��|�X,����      H   j   x�]�;� EњY�+�0���5��	�&	���0C�U7y9��OJ����B��|��w�+���z��� +Ce�3lUFʨg�2���qϸeR�(��I� /�S      L   \   x�%ͻ@ј��
Ѝ��!	�w�dGo�Y���)�=�t0��J;ݜ�pӋ�B�%V���ڱ���+��ʻ�<X^�>��y��'A     