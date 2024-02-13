DO $$ 
DECLARE 
    jmeno_array TEXT[];
BEGIN
    jmeno_array := ARRAY['Jakub', 'Adam', 'Tomáš', 'Lukáš', 'Jan', 'Marek', 'Michal', 'Petr', 'Martin', 'Jiří', 'David', 'Daniel', 'Ondřej', 'Pavel', 'Filip', 'Václav', 'Karel', 'Richard', 'Aleš', 'Josef', 'Radek', 'František', 'Eduard', 'Viktor', 'Milan', 'Vojtěch', 'Matěj', 'Jaroslav', 'Miroslav', 'Aleš', 'Zdeněk', 'Radim', 'Honza', 'Libor', 'Dominik', 'Jindřich', 'Bohumil', 'Štěpán', 'Vlastimil', 'Hynek', 'Dalibor', 'Viktor', 'Igor', 'Antonín', 'Jáchym', 'Emanuel', 'Vladimír', 'Bedřich', 'Oldřich', 'Stanislav',
                        'Tereza', 'Lucie', 'Karolína', 'Veronika', 'Kateřina', 'Petra', 'Markéta', 'Jana', 'Barbora', 'Anna', 'Hana', 'Eliška', 'Alžběta', 'Adéla', 'Ivana', 'Klára', 'Lenka', 'Michaela', 'Nikola', 'Zuzana', 'Kamila', 'Šárka', 'Martina', 'Denisa', 'Kristýna', 'Simona', 'Natálie', 'Vendula', 'Blanka', 'Věra', 'Dominika', 'Renáta', 'Magdaléna', 'Dagmar', 'Veronika', 'Lea', 'Andrea', 'Linda', 'Nela', 'Emilie', 'Helena', 'Marcela', 'Vlasta', 'Květa', 'Viktorie', 'Stanislava', 'Táňa', 'Jarmila', 'Renata', 'Ludmila'
];

    UPDATE student 
    SET jmeno = jmeno_array[gs]
    FROM generate_series(1, 100) AS gs
    WHERE student.id_student = gs;
END $$;

DO $$ 
DECLARE 
    prijmeni_array TEXT[];
BEGIN
    prijmeni_array := ARRAY['Novák', 'Svoboda', 'Novotný', 'Dvořák', 'Černý', 'Procházka', 'Kučera', 'Veselý', 'Horák', 'Němec', 
    'Marek', 'Pospíšil', 'Hájek', 'Jelínek', 'Král', 'Růžička', 'Beneš', 'Fiala', 'Sedláček', 'Bartoš', 
    'Urban', 'Šimek', 'Pavlík', 'Ježek', 'Mach', 'Kolář', 'Blažek', 'Polák', 'Hruška', 'Císař', 
    'Fišer', 'Zeman', 'Štěpánek', 'Bárta', 'Richter', 'Vlček', 'Krejčí', 'Dušek', 'Müller', 'Holub', 
    'Havlíček', 'Mareš', 'Vaněk', 'Sýkora', 'Hlaváček', 'Tichý', 'Tomeček', 'Beran', 'Veselá', 'Kratochvíl', 
    'Macháček', 'Pospíchal', 'Ryba', 'Kuchař', 'Roubal', 'Valenta', 'Švec', 'Kubík', 'Havelka', 'Hodný', 
    'Petráš', 'Kolman', 'Havel', 'Kasal', 'Hoffmann', 'Štěpán', 'Sobotka', 'Malý', 'Žáček', 'Hrubý', 
    'Kratochvíl', 'Hromádka', 'Červený', 'Pánek', 'Hála', 'Kopecký', 'Bílý', 'Šimůnek', 'Bureš', 'Krátký', 
    'Svatoň', 'Fojtík', 'Čermák', 'Sedlák', 'Mládek', 'Hanuš', 'Zima', 'Pavlíček', 'Chalupa', 'Škoda', 
    'Holý', 'Pekárek', 'Sýkora', 'Němcová', 'Kolombová', 'Navrátil', 'Horváth', 'Nový', 'Malík', 'Pešek'
];

    UPDATE student 
    SET prijmeni = prijmeni_array[gs]
    FROM generate_series(1, 100) AS gs
    WHERE student.id_student = gs;
END $$;

DO $$ 
DECLARE 
    language_array TEXT[];
BEGIN
    language_array := ARRAY['English', 'Czech', 'Spanish', 'Deutsch', 'Ukrainian', 'Italian', 'French'];

    UPDATE student 
    SET jazyk = language_array[1]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 1';
    UPDATE student 
    SET jazyk = language_array[2]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 2';
    UPDATE student 
    SET jazyk = language_array[3]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 3';
    UPDATE student 
    SET jazyk = language_array[4]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 4';
    UPDATE student 
    SET jazyk = language_array[5]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 5';
    UPDATE student 
    SET jazyk = language_array[6]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 6';
    UPDATE student 
    SET jazyk = language_array[7]
    FROM generate_series(1, 100) AS gs
    WHERE student.jazyk = 'Language 7';
END $$;