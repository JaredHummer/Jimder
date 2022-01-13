create table category (
    id              integer not null primary key generated always as identity,
    name            text    not null,
    description     text    not null,
    icon_url        text    not null
);

create table account (
    id              integer not null primary key generated always as identity,
    username        text    not null,
    password        text    not null,
    picture_url     text    not null,
    description     text    not null,
    contact_info    text    not null,
);

create unique index ix_username on account(username asc);

create table account_category (
    id              integer not null primary key generated always as identity,
    account_id      integer not null,
    category_id     integer not null,
    enabled         boolean not null,
    description     text    not null,

    constraint fk_account  foreign key(account_id)  references account(id),
    constraint fk_category foreign key(category_id) references category(id),
);

create unique index ix_account_category on account_category(account_id asc, category_id asc);

create table impression (
    id              integer not null primary key generated always as identity,
    inverse_id      integer,
    receiver_id     integer not null,
    subject_id      integer not null,
    accepted        boolean,

    constraint fk_inverse  foreign key(inverse_id)  references impression(id),
    constraint fk_receiver foreign key(receiver_id) references account(id),
    constraint fk_subject  foreign key(subject_id)  references account(id),
);

create unique index ix_impression_receiver_subject on impression(receiver_id asc, subject_id asc);
create unique index ix_impression_receiver_subject on impression(receiver_id asc, accepted asc nulls first);
