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
    contact_info    text    not null
);

create unique index ix_username on account(username asc);

create table account_category (
    id              integer not null primary key generated always as identity,
    account_id      integer not null,
    category_id     integer not null,
    enabled         boolean not null,
    description     text    not null,

    constraint fk_account  foreign key(account_id)  references account(id),
    constraint fk_category foreign key(category_id) references category(id)
);

create unique index ix_account_category on account_category(account_id asc, category_id asc);
create index ix_account_category_category on account_category(category_id asc);

create table impression (
    id              integer not null primary key generated always as identity,
    inverse_id      integer,
    receiver_id     integer not null,
    subject_id      integer not null,
    accepted        boolean,
    created_at      timestamp with time zone,

    constraint fk_inverse  foreign key(inverse_id)  references impression(id),
    constraint fk_receiver foreign key(receiver_id) references account(id),
    constraint fk_subject  foreign key(subject_id)  references account(id)
);

create unique index ix_impression_receiver_subject on impression(receiver_id asc, subject_id asc);
create        index ix_impression_receiver_accepted on impression(receiver_id asc, accepted asc nulls first);

insert into category (name, description, icon_url) values
    ('cat1', '', ''),
    ('cat2', '', ''),
    ('cat3', '', ''),
    ('cat4', '', ''),
    ('cat5', '', ''),
    ('cat6', '', ''),
    ('cat7', '', '');

insert into account (username, password, picture_url, description, contact_info) values
    ('per1', '', '', '', ''),
    ('per2', '', '', '', ''),
    ('per3', '', '', '', ''),
    ('per4', '', '', '', ''),
    ('per5', '', '', '', ''),
    ('per6', '', '', '', ''),
    ('per7', '', '', '', ''),
    ('per8', '', '', '', '');

insert into account_category (account_id, category_id, enabled, description) values
    (5, 1, true, ''),
    (5, 2, true, ''),
    (5, 3, true, ''),

    (6, 1, true, ''),
    (6, 4, true, ''),
    (6, 5, true, ''),

    (7, 2, true, ''),
    (7, 3, true, ''),
    (7, 6, true, '');
