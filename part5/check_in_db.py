import sql


def is_table(name: str):
    return sql.execute(str("SELECT * FROM " + name + ";"))


def are_attributes(table: str, attributes: str):
    return sql.execute(str("SELECT " + attributes + " FROM " + table + ";"))
