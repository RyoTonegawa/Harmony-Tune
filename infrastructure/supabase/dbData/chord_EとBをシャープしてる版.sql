drop table chord_master;

CREATE TABLE chord_master (
    root VARCHAR(3) NOT NULL,
    chord_name VARCHAR(20) NOT NULL,
    tones JSONB NOT NULL,
    degrees JSONB NOT NULL,
    latest_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (root, chord_name),
    FOREIGN KEY (chord_name) REFERENCES chord_notation_master(chord_name) ON DELETE CASCADE
);

INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Major', '["C", "E", "G"]', '["root", "major_third", "perfect_fifth"]'),
('C', 'Minor', '["C", "D#", "G"]', '["root", "minor_third", "perfect_fifth"]'),
('C', 'Major 7th', '["C", "E", "G", "B"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('C', 'Minor 7th', '["C", "D#", "G", "A#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('C', 'Dominant 7th', '["C", "E", "G", "A#"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('C', 'Diminished', '["C", "D#", "F#"]', '["root", "minor_third", "diminished_fifth"]'),
('C', 'Augmented', '["C", "E", "G#"]', '["root", "major_third", "augmented_fifth"]'),
('C', 'Suspended 2nd', '["C", "D", "G"]', '["root", "major_second", "perfect_fifth"]'),
('C', 'Suspended 4th', '["C", "F", "G"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('C', 'Add 9', '["C", "E", "G", "D"]', '["root", "major_third", "perfect_fifth", "ninth"]'),
('C', 'Major 9th', '["C", "E", "G", "B", "D"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth"]'),
('C', 'Minor 9th', '["C", "D#", "G", "A#", "D"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth"]'),
('C', 'Major 11th', '["C", "E", "G", "B", "D", "F"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth", "eleventh"]'),
('C', 'Minor 11th', '["C", "D#", "G", "A#", "D", "F"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth", "eleventh"]'),
('C', 'Major 13th', '["C", "E", "G", "B", "D", "F", "A"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth", "eleventh", "thirteenth"]'),
('C', 'Minor 13th', '["C", "D#", "G", "A#", "D", "F", "A"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth", "eleventh", "thirteenth"]');
-- D のコード
-- D のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('D', 'Major', '["D", "F#", "A"]', '["root", "major_third", "perfect_fifth"]'),
('D', 'Minor', '["D", "F", "A"]', '["root", "minor_third", "perfect_fifth"]'),
('D', 'Major 7th', '["D", "F#", "A", "C#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('D', 'Minor 7th', '["D", "F", "A", "C"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('D', 'Dominant 7th', '["D", "F#", "A", "C"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('D', 'Diminished', '["D", "F", "G#"]', '["root", "minor_third", "diminished_fifth"]'),
('D', 'Augmented', '["D", "F#", "A#"]', '["root", "major_third", "augmented_fifth"]'),
('D', 'Suspended 2nd', '["D", "E", "A"]', '["root", "major_second", "perfect_fifth"]'),
('D', 'Suspended 4th', '["D", "G", "A"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('D', 'Add 9', '["D", "F#", "A", "E"]', '["root", "major_third", "perfect_fifth", "ninth"]'),
('D', 'Major 9th', '["D", "F#", "A", "C#", "E"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth"]'),
('D', 'Minor 9th', '["D", "F", "A", "C", "E"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth"]'),
('D', 'Major 11th', '["D", "F#", "A", "C#", "E", "G"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth", "eleventh"]'),
('D', 'Minor 11th', '["D", "F", "A", "C", "E", "G"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth", "eleventh"]'),
('D', 'Major 13th', '["D", "F#", "A", "C#", "E", "G", "B"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth", "eleventh", "thirteenth"]'),
('D', 'Minor 13th', '["D", "F", "A", "C", "E", "G", "B"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth", "eleventh", "thirteenth"]');

-- E のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('E', 'Major', '["E", "G#", "B"]', '["root", "major_third", "perfect_fifth"]'),
('E', 'Minor', '["E", "G", "B"]', '["root", "minor_third", "perfect_fifth"]'),
('E', 'Major 7th', '["E", "G#", "B", "D#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('E', 'Minor 7th', '["E", "G", "B", "D"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('E', 'Dominant 7th', '["E", "G#", "B", "D"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('E', 'Diminished', '["E", "G", "A#"]', '["root", "minor_third", "diminished_fifth"]'),
('E', 'Augmented', '["E", "G#", "C"]', '["root", "major_third", "augmented_fifth"]'),
('E', 'Suspended 2nd', '["E", "F#", "B"]', '["root", "major_second", "perfect_fifth"]'),
('E', 'Suspended 4th', '["E", "A", "B"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('E', 'Add 9', '["E", "G#", "B", "F#"]', '["root", "major_third", "perfect_fifth", "ninth"]'),
('E', 'Major 9th', '["E", "G#", "B", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth"]'),
('E', 'Minor 9th', '["E", "G", "B", "D", "F#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth"]'),
('E', 'Major 11th', '["E", "G#", "B", "D#", "F#", "A"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth", "eleventh"]'),
('E', 'Minor 11th', '["E", "G", "B", "D", "F#", "A"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth", "eleventh"]'),
('E', 'Major 13th', '["E", "G#", "B", "D#", "F#", "A", "C#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "ninth", "eleventh", "thirteenth"]'),
('E', 'Minor 13th', '["E", "G", "B", "D", "F#", "A", "C#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "ninth", "eleventh", "thirteenth"]');


-- F のコード
-- F のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('F', 'Major', '["F", "A", "C"]', '["root", "major_third", "perfect_fifth"]'),
('F', 'Minor', '["F", "G#", "C"]', '["root", "minor_third", "perfect_fifth"]'),
('F', 'Major 7th', '["F", "A", "C", "E"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('F', 'Minor 7th', '["F", "G#", "C", "D#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('F', 'Dominant 7th', '["F", "A", "C", "D#"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('F', 'Diminished', '["F", "G#", "B"]', '["root", "minor_third", "diminished_fifth"]'),
('F', 'Augmented', '["F", "A", "C#"]', '["root", "major_third", "augmented_fifth"]'),
('F', 'Suspended 2nd', '["F", "G", "C"]', '["root", "major_second", "perfect_fifth"]'),
('F', 'Suspended 4th', '["F", "A#", "C"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('F', 'Add 9', '["F", "A", "C", "G"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('F', 'Major 9th', '["F", "A", "C", "E", "G"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('F', 'Minor 9th', '["F", "G#", "C", "D#", "G"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('F', 'Major 11th', '["F", "A", "C", "E", "G", "A#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('F', 'Minor 11th', '["F", "G#", "C", "D#", "G", "A#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('F', 'Major 13th', '["F", "A", "C", "E", "G", "A#", "D"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('F', 'Minor 13th', '["F", "G#", "C", "D#", "G", "A#", "D"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

-- G のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('G', 'Major', '["G", "B", "D"]', '["root", "major_third", "perfect_fifth"]'),
('G', 'Minor', '["G", "A#", "D"]', '["root", "minor_third", "perfect_fifth"]'),
('G', 'Major 7th', '["G", "B", "D", "F#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('G', 'Minor 7th', '["G", "A#", "D", "F"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('G', 'Dominant 7th', '["G", "B", "D", "F"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('G', 'Diminished', '["G", "A#", "C#"]', '["root", "minor_third", "diminished_fifth"]'),
('G', 'Augmented', '["G", "B", "D#"]', '["root", "major_third", "augmented_fifth"]'),
('G', 'Suspended 2nd', '["G", "A", "D"]', '["root", "major_second", "perfect_fifth"]'),
('G', 'Suspended 4th', '["G", "C", "D"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('G', 'Add 9', '["G", "B", "D", "A"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('G', 'Major 9th', '["G", "B", "D", "F#", "A"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('G', 'Minor 9th', '["G", "A#", "D", "F", "A"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('G', 'Major 11th', '["G", "B", "D", "F#", "A", "C"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('G', 'Minor 11th', '["G", "A#", "D", "F", "A", "C"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('G', 'Major 13th', '["G", "B", "D", "F#", "A", "C", "E"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('G', 'Minor 13th', '["G", "A#", "D", "F", "A", "C", "E"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

-- A のコード
-- A のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('A', 'Major', '["A", "C#", "E"]', '["root", "major_third", "perfect_fifth"]'),
('A', 'Minor', '["A", "C", "E"]', '["root", "minor_third", "perfect_fifth"]'),
('A', 'Major 7th', '["A", "C#", "E", "G#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('A', 'Minor 7th', '["A", "C", "E", "G"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('A', 'Dominant 7th', '["A", "C#", "E", "G"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('A', 'Diminished', '["A", "C", "D#"]', '["root", "minor_third", "diminished_fifth"]'),
('A', 'Augmented', '["A", "C#", "F"]', '["root", "major_third", "augmented_fifth"]'),
('A', 'Suspended 2nd', '["A", "B", "E"]', '["root", "major_second", "perfect_fifth"]'),
('A', 'Suspended 4th', '["A", "D", "E"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('A', 'Add 9', '["A", "C#", "E", "B"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('A', 'Major 9th', '["A", "C#", "E", "G#", "B"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('A', 'Minor 9th', '["A", "C", "E", "G", "B"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('A', 'Major 11th', '["A", "C#", "E", "G#", "B", "D"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('A', 'Minor 11th', '["A", "C", "E", "G", "B", "D"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('A', 'Major 13th', '["A", "C#", "E", "G#", "B", "D", "F#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('A', 'Minor 13th', '["A", "C", "E", "G", "B", "D", "F#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

-- B のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('B', 'Major', '["B", "D#", "F#"]', '["root", "major_third", "perfect_fifth"]'),
('B', 'Minor', '["B", "D", "F#"]', '["root", "minor_third", "perfect_fifth"]'),
('B', 'Major 7th', '["B", "D#", "F#", "A#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('B', 'Minor 7th', '["B", "D", "F#", "A"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('B', 'Dominant 7th', '["B", "D#", "F#", "A"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('B', 'Diminished', '["B", "D", "F"]', '["root", "minor_third", "diminished_fifth"]'),
('B', 'Augmented', '["B", "D#", "G"]', '["root", "major_third", "augmented_fifth"]'),
('B', 'Suspended 2nd', '["B", "C#", "F#"]', '["root", "major_second", "perfect_fifth"]'),
('B', 'Suspended 4th', '["B", "E", "F#"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('B', 'Add 9', '["B", "D#", "F#", "C#"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('B', 'Major 9th', '["B", "D#", "F#", "A#", "C#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('B', 'Minor 9th', '["B", "D", "F#", "A", "C#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('B', 'Major 11th', '["B", "D#", "F#", "A#", "C#", "E"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('B', 'Minor 11th', '["B", "D", "F#", "A", "C#", "E"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('B', 'Major 13th', '["B", "D#", "F#", "A#", "C#", "E", "G#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('B', 'Minor 13th', '["B", "D", "F#", "A", "C#", "E", "G#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');


-- C# のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C#', 'Major', '["C#", "E#", "G#"]', '["root", "major_third", "perfect_fifth"]'),
('C#', 'Minor', '["C#", "E", "G#"]', '["root", "minor_third", "perfect_fifth"]'),
('C#', 'Major 7th', '["C#", "E#", "G#", "B#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('C#', 'Minor 7th', '["C#", "E", "G#", "B"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('C#', 'Dominant 7th', '["C#", "E#", "G#", "B"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('C#', 'Diminished', '["C#", "E", "G"]', '["root", "minor_third", "diminished_fifth"]'),
('C#', 'Augmented', '["C#", "E#", "A"]', '["root", "major_third", "augmented_fifth"]'),
('C#', 'Suspended 2nd', '["C#", "D#", "G#"]', '["root", "major_second", "perfect_fifth"]'),
('C#', 'Suspended 4th', '["C#", "F#", "G#"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('C#', 'Add 9', '["C#", "E#", "G#", "D#"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('C#', 'Major 9th', '["C#", "E#", "G#", "B#", "D#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('C#', 'Minor 9th', '["C#", "E", "G#", "B", "D#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('C#', 'Major 11th', '["C#", "E#", "G#", "B#", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('C#', 'Minor 11th', '["C#", "E", "G#", "B", "D#", "F#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('C#', 'Major 13th', '["C#", "E#", "G#", "B#", "D#", "F#", "A#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('C#', 'Minor 13th', '["C#", "E", "G#", "B", "D#", "F#", "A#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES
('D#', 'Major', '["D#", "F#", "A#"]', '["root", "major_third", "perfect_fifth"]'),
('D#', 'Minor', '["D#", "F", "A#"]', '["root", "minor_third", "perfect_fifth"]'),
('D#', 'Major 7th', '["D#", "F#", "A#", "C#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('D#', 'Minor 7th', '["D#", "F", "A#", "C"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('D#', 'Dominant 7th', '["D#", "F#", "A#", "C"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('D#', 'Diminished', '["D#", "F", "A"]', '["root", "minor_third", "diminished_fifth"]'),
('D#', 'Augmented', '["D#", "F#", "B"]', '["root", "major_third", "augmented_fifth"]'),
('D#', 'Suspended 2nd', '["D#", "E#", "A#"]', '["root", "major_second", "perfect_fifth"]'),
('D#', 'Suspended 4th', '["D#", "G#", "A#"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('D#', 'Add 9', '["D#", "F#", "A#", "E#"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('D#', 'Major 9th', '["D#", "F#", "A#", "C#", "E#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('D#', 'Minor 9th', '["D#", "F", "A#", "C", "E#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('D#', 'Major 11th', '["D#", "F#", "A#", "C#", "E#", "G#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('D#', 'Minor 11th', '["D#", "F", "A#", "C", "E#", "G#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('D#', 'Major 13th', '["D#", "F#", "A#", "C#", "E#", "G#", "B#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('D#', 'Minor 13th', '["D#", "F", "A#", "C", "E#", "G#", "B#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');


-- F# のコード
-- F# のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('F#', 'Major', '["F#", "A#", "C#"]', '["root", "major_third", "perfect_fifth"]'),
('F#', 'Minor', '["F#", "A", "C#"]', '["root", "minor_third", "perfect_fifth"]'),
('F#', 'Major 7th', '["F#", "A#", "C#", "E#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('F#', 'Minor 7th', '["F#", "A", "C#", "E"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('F#', 'Dominant 7th', '["F#", "A#", "C#", "E"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('F#', 'Diminished', '["F#", "A", "C"]', '["root", "minor_third", "diminished_fifth"]'),
('F#', 'Augmented', '["F#", "A#", "D"]', '["root", "major_third", "augmented_fifth"]'),
('F#', 'Suspended 2nd', '["F#", "G#", "C#"]', '["root", "major_second", "perfect_fifth"]'),
('F#', 'Suspended 4th', '["F#", "B", "C#"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('F#', 'Add 9', '["F#", "A#", "C#", "G#"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('F#', 'Major 9th', '["F#", "A#", "C#", "E#", "G#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('F#', 'Minor 9th', '["F#", "A", "C#", "E", "G#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('F#', 'Major 11th', '["F#", "A#", "C#", "E#", "G#", "B"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('F#', 'Minor 11th', '["F#", "A", "C#", "E", "G#", "B"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('F#', 'Major 13th', '["F#", "A#", "C#", "E#", "G#", "B", "D#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('F#', 'Minor 13th', '["F#", "A", "C#", "E", "G#", "B", "D#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

-- G# のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('G#', 'Major', '["G#", "B#", "D#"]', '["root", "major_third", "perfect_fifth"]'),
('G#', 'Minor', '["G#", "B", "D#"]', '["root", "minor_third", "perfect_fifth"]'),
('G#', 'Major 7th', '["G#", "B#", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('G#', 'Minor 7th', '["G#", "B", "D#", "F#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('G#', 'Dominant 7th', '["G#", "B#", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('G#', 'Diminished', '["G#", "B", "D"]', '["root", "minor_third", "diminished_fifth"]'),
('G#', 'Augmented', '["G#", "B#", "E"]', '["root", "major_third", "augmented_fifth"]'),
('G#', 'Suspended 2nd', '["G#", "A#", "D#"]', '["root", "major_second", "perfect_fifth"]'),
('G#', 'Suspended 4th', '["G#", "C#", "D#"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('G#', 'Add 9', '["G#", "B#", "D#", "A#"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('G#', 'Major 9th', '["G#", "B#", "D#", "F#", "A#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('G#', 'Minor 9th', '["G#", "B", "D#", "F#", "A#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('G#', 'Major 11th', '["G#", "B#", "D#", "F#", "A#", "C#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('G#', 'Minor 11th', '["G#", "B", "D#", "F#", "A#", "C#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('G#', 'Major 13th', '["G#", "B#", "D#", "F#", "A#", "C#", "E#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('G#', 'Minor 13th', '["G#", "B", "D#", "F#", "A#", "C#", "E#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');


-- A# のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('A#', 'Major', '["A#", "C#", "E#"]', '["root", "major_third", "perfect_fifth"]'),
('A#', 'Minor', '["A#", "C", "E#"]', '["root", "minor_third", "perfect_fifth"]'),
('A#', 'Major 7th', '["A#", "C#", "E#", "G#"]', '["root", "major_third", "perfect_fifth", "major_seventh"]'),
('A#', 'Minor 7th', '["A#", "C", "E#", "G#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh"]'),
('A#', 'Dominant 7th', '["A#", "C#", "E#", "G#"]', '["root", "major_third", "perfect_fifth", "minor_seventh"]'),
('A#', 'Diminished', '["A#", "C", "E"]', '["root", "minor_third", "diminished_fifth"]'),
('A#', 'Augmented', '["A#", "C#", "F"]', '["root", "major_third", "augmented_fifth"]'),
('A#', 'Suspended 2nd', '["A#", "B#", "E#"]', '["root", "major_second", "perfect_fifth"]'),
('A#', 'Suspended 4th', '["A#", "D#", "E#"]', '["root", "perfect_fourth", "perfect_fifth"]'),
('A#', 'Add 9', '["A#", "C#", "E#", "B#"]', '["root", "major_third", "perfect_fifth", "major_ninth"]'),
('A#', 'Major 9th', '["A#", "C#", "E#", "G#", "B#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('A#', 'Minor 9th', '["A#", "C", "E#", "G#", "B#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('A#', 'Major 11th', '["A#", "C#", "E#", "G#", "B#", "D#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('A#', 'Minor 11th', '["A#", "C", "E#", "G#", "B#", "D#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('A#', 'Major 13th', '["A#", "C#", "E#", "G#", "B#", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('A#', 'Minor 13th', '["A#", "C", "E#", "G#", "B#", "D#", "F#"]', '["root", "minor_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

-- Dominant 9th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Dominant 9th', '["C", "E", "G", "A#", "D"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('D', 'Dominant 9th', '["D", "F#", "A", "C", "E"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('E', 'Dominant 9th', '["E", "G#", "B", "D", "F#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('F', 'Dominant 9th', '["F", "A", "C", "D#", "G"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('G', 'Dominant 9th', '["G", "B", "D", "F", "A"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('A', 'Dominant 9th', '["A", "C#", "E", "G", "B"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('B', 'Dominant 9th', '["B", "D#", "F#", "A", "C#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('C#', 'Dominant 9th', '["C#", "E#", "G#", "B", "D#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('D#', 'Dominant 9th', '["D#", "F#", "A#", "C#", "E#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('F#', 'Dominant 9th', '["F#", "A#", "C#", "E", "G#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('G#', 'Dominant 9th', '["G#", "B#", "D#", "F#", "A#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]'),
('A#', 'Dominant 9th', '["A#", "C#", "E#", "G#", "B#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth"]');


-- Dominant 11th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Dominant 11th', '["C", "E", "G", "A#", "D", "F"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('D', 'Dominant 11th', '["D", "F#", "A", "C", "E", "G"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('E', 'Dominant 11th', '["E", "G#", "B", "D", "F#", "A"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('F', 'Dominant 11th', '["F", "A", "C", "D#", "G", "A#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('G', 'Dominant 11th', '["G", "B", "D", "F", "A", "C"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('A', 'Dominant 11th', '["A", "C#", "E", "G", "B", "D"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('B', 'Dominant 11th', '["B", "D#", "F#", "A", "C#", "E"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('C#', 'Dominant 11th', '["C#", "E#", "G#", "B", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('D#', 'Dominant 11th', '["D#", "F#", "A#", "C#", "E#", "G#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('F#', 'Dominant 11th', '["F#", "A#", "C#", "E", "G#", "B"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('G#', 'Dominant 11th', '["G#", "B#", "D#", "F#", "A#", "C#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]'),
('A#', 'Dominant 11th', '["A#", "C#", "E#", "G#", "B#", "D#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh"]');

-- Dominant 13th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Dominant 13th', '["C", "E", "G", "A#", "D", "F", "A"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('D', 'Dominant 13th', '["D", "F#", "A", "C", "E", "G", "B"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('E', 'Dominant 13th', '["E", "G#", "B", "D", "F#", "A", "C#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('F', 'Dominant 13th', '["F", "A", "C", "D#", "G", "A#", "D"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('G', 'Dominant 13th', '["G", "B", "D", "F", "A", "C", "E"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('A', 'Dominant 13th', '["A", "C#", "E", "G", "B", "D", "F#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('B', 'Dominant 13th', '["B", "D#", "F#", "A", "C#", "E", "G#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('C#', 'Dominant 13th', '["C#", "E#", "G#", "B", "D#", "F#", "A#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('D#', 'Dominant 13th', '["D#", "F#", "A#", "C#", "E#", "G#", "B#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('F#', 'Dominant 13th', '["F#", "A#", "C#", "E", "G#", "B", "D#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('G#', 'Dominant 13th', '["G#", "B#", "D#", "F#", "A#", "C#", "E#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('A#', 'Dominant 13th', '["A#", "C#", "E#", "G#", "B#", "D#", "F#"]', '["root", "major_third", "perfect_fifth", "minor_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');

-- ============================================
-- Diminished 7th (dim7) の登録
-- ============================================
-- Diminished 7th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Diminished 7th', '["C", "D#", "F#", "A"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('C#', 'Diminished 7th', '["C#", "E", "G", "A#"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('D', 'Diminished 7th', '["D", "F", "G#", "B"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('D#', 'Diminished 7th', '["D#", "F#", "A", "C"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('E', 'Diminished 7th', '["E", "G", "A#", "C#"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('F', 'Diminished 7th', '["F", "G#", "B", "D"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('F#', 'Diminished 7th', '["F#", "A", "C", "D#"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('G', 'Diminished 7th', '["G", "A#", "C#", "E"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('G#', 'Diminished 7th', '["G#", "B", "D", "F"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('A', 'Diminished 7th', '["A", "C", "D#", "F#"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('A#', 'Diminished 7th', '["A#", "C#", "E", "G"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]'),
('B', 'Diminished 7th', '["B", "D", "F", "G#"]', '["root", "minor_third", "diminished_fifth", "diminished_seventh"]');

-- Half-Diminished のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Half-Diminished', '["C", "D#", "F#", "A#"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('C#', 'Half-Diminished', '["C#", "E", "G", "B"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('D', 'Half-Diminished', '["D", "F", "G#", "C"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('D#', 'Half-Diminished', '["D#", "F#", "A", "C#"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('E', 'Half-Diminished', '["E", "G", "A#", "D"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('F', 'Half-Diminished', '["F", "G#", "B", "D#"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('F#', 'Half-Diminished', '["F#", "A", "C", "E"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('G', 'Half-Diminished', '["G", "A#", "C#", "F"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('G#', 'Half-Diminished', '["G#", "B", "D", "F#"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('A', 'Half-Diminished', '["A", "C", "D#", "G"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('A#', 'Half-Diminished', '["A#", "C#", "E", "G#"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]'),
('B', 'Half-Diminished', '["B", "D", "F", "A"]', '["root", "minor_third", "diminished_fifth", "minor_seventh"]');

-- Minor Major 7th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Minor Major 7th', '["C", "D#", "G", "B"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('C#', 'Minor Major 7th', '["C#", "E", "G#", "B#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('D', 'Minor Major 7th', '["D", "F", "A", "C#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('D#', 'Minor Major 7th', '["D#", "F#", "A#", "D"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('E', 'Minor Major 7th', '["E", "G", "B", "D#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('F', 'Minor Major 7th', '["F", "G#", "C", "E"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('F#', 'Minor Major 7th', '["F#", "A", "C#", "E#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('G', 'Minor Major 7th', '["G", "A#", "D", "F#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('G#', 'Minor Major 7th', '["G#", "B", "D#", "G"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('A', 'Minor Major 7th', '["A", "C", "E", "G#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('A#', 'Minor Major 7th', '["A#", "C#", "E#", "A"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]'),
('B', 'Minor Major 7th', '["B", "D", "F#", "A#"]', '["root", "minor_third", "perfect_fifth", "major_seventh"]');

-- Minor Major 9th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Minor Major 9th', '["C", "D#", "G", "B", "D"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('C#', 'Minor Major 9th', '["C#", "E", "G#", "B#", "D#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('D', 'Minor Major 9th', '["D", "F", "A", "C#", "E"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('D#', 'Minor Major 9th', '["D#", "F#", "A#", "D", "F"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('E', 'Minor Major 9th', '["E", "G", "B", "D#", "F#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('F', 'Minor Major 9th', '["F", "G#", "C", "E", "G"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('F#', 'Minor Major 9th', '["F#", "A", "C#", "E#", "G#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('G', 'Minor Major 9th', '["G", "A#", "D", "F#", "A"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('G#', 'Minor Major 9th', '["G#", "B", "D#", "G", "A#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('A', 'Minor Major 9th', '["A", "C", "E", "G#", "B"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('A#', 'Minor Major 9th', '["A#", "C#", "E#", "A", "C"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]'),
('B', 'Minor Major 9th', '["B", "D", "F#", "A#", "C#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth"]');


-- ============================================
-- Minor Major 11th (mMaj11) の登録
-- ============================================

-- Minor Major 11th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Minor Major 11th', '["C", "D#", "G", "B", "D", "F"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('C#', 'Minor Major 11th', '["C#", "E", "G#", "B#", "D#", "F#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('D', 'Minor Major 11th', '["D", "F", "A", "C#", "E", "G"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('D#', 'Minor Major 11th', '["D#", "F#", "A#", "D", "F", "G#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('E', 'Minor Major 11th', '["E", "G", "B", "D#", "F#", "A"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('F', 'Minor Major 11th', '["F", "G#", "C", "E", "G", "A#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('F#', 'Minor Major 11th', '["F#", "A", "C#", "E#", "G#", "B"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('G', 'Minor Major 11th', '["G", "A#", "D", "F#", "A", "C"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('G#', 'Minor Major 11th', '["G#", "B", "D#", "G", "A#", "C#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('A', 'Minor Major 11th', '["A", "C", "E", "G#", "B", "D"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('A#', 'Minor Major 11th', '["A#", "C#", "E#", "A", "C", "D#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]'),
('B', 'Minor Major 11th', '["B", "D", "F#", "A#", "C#", "E"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh"]');

-- Minor Major 13th のコード
INSERT INTO chord_master (root, chord_name, tones, degrees) VALUES 
('C', 'Minor Major 13th', '["C", "D#", "G", "B", "D", "F", "A"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('C#', 'Minor Major 13th', '["C#", "E", "G#", "B#", "D#", "F#", "A#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('D', 'Minor Major 13th', '["D", "F", "A", "C#", "E", "G", "B"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('D#', 'Minor Major 13th', '["D#", "F#", "A#", "D", "F", "G#", "C"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('E', 'Minor Major 13th', '["E", "G", "B", "D#", "F#", "A", "C#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('F', 'Minor Major 13th', '["F", "G#", "C", "E", "G", "A#", "D"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('F#', 'Minor Major 13th', '["F#", "A", "C#", "E#", "G#", "B", "D#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('G', 'Minor Major 13th', '["G", "A#", "D", "F#", "A", "C", "E"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('G#', 'Minor Major 13th', '["G#", "B", "D#", "G", "A#", "C#", "F"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('A', 'Minor Major 13th', '["A", "C", "E", "G#", "B", "D", "F#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('A#', 'Minor Major 13th', '["A#", "C#", "E#", "A", "C", "D#", "G"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]'),
('B', 'Minor Major 13th', '["B", "D", "F#", "A#", "C#", "E", "G#"]', '["root", "minor_third", "perfect_fifth", "major_seventh", "major_ninth", "perfect_eleventh", "major_thirteenth"]');



