create table category (
    id          integer not null primary key generated always as identity,
    name        text    not null
);

create table account (
    id          integer not null primary key generated always as identity,
    username    text    not null unique,
    password    text    not null
);

create index ix_username on account(username asc);

create table account_category (
    id          integer not null primary key generated always as identity,
    account_id  integer not null,
    category_id integer not null,
    enabled     boolean not null,
    description text    not null,

    constraint fk_account  foreign key(account_id)  references account(id),
    constraint fk_category foreign key(category_id) references category(id),
    constraint uq_account_category unique(account_id, category_id)
);

create index ix_account_category on account_category(account_id asc, category_id asc);
