
drop table scale_master;
CREATE TABLE scale_master (
    scale_key VARCHAR(3) NOT NULL,
    scale_name VARCHAR(20) NOT NULL,
    notes JSONB NOT NULL,
    latest_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (scale_key, scale_name)
);

-- ============================================
-- Major スケールの登録
-- ============================================

INSERT INTO scale_master (scale_key, scale_name, notes) VALUES 
('C', 'Major', '["C", "D", "E", "F", "G", "A", "B"]'),
('C#', 'Major', '["C#", "D#", "E#", "F#", "G#", "A#", "B#"]'),
('D', 'Major', '["D", "E", "F#", "G", "A", "B", "C#"]'),
('D#', 'Major', '["D#", "E#", "F#", "G#", "A#", "B#", "C#"]'),
('E', 'Major', '["E", "F#", "G#", "A", "B", "C#", "D#"]'),
('F', 'Major', '["F", "G", "A", "A#", "C", "D", "E"]'),
('F#', 'Major', '["F#", "G#", "A#", "B", "C#", "D#", "E#"]'),
('G', 'Major', '["G", "A", "B", "C", "D", "E", "F#"]'),
('G#', 'Major', '["G#", "A#", "B#", "C#", "D#", "E#", "F#"]'),
('A', 'Major', '["A", "B", "C#", "D", "E", "F#", "G#"]'),
('A#', 'Major', '["A#", "B#", "C#", "D#", "E#", "F#", "G#"]'),
('B', 'Major', '["B", "C#", "D#", "E", "F#", "G#", "A#"]');

-- ============================================
-- Natural Minor スケールの登録
-- ============================================

INSERT INTO scale_master (scale_key, scale_name, notes) VALUES 
('C', 'Natural Minor', '["C", "D", "D#", "F", "G", "G#", "A#"]'),
('C#', 'Natural Minor', '["C#", "D#", "E", "F#", "G#", "A", "B"]'),
('D', 'Natural Minor', '["D", "E", "F", "G", "A", "A#", "C"]'),
('D#', 'Natural Minor', '["D#", "E#", "F#", "G#", "A#", "B", "C#"]'),
('E', 'Natural Minor', '["E", "F#", "G", "A", "B", "C", "D"]'),
('F', 'Natural Minor', '["F", "G", "G#", "A#", "C", "C#", "D#"]'),
('F#', 'Natural Minor', '["F#", "G#", "A", "B", "C#", "D", "E"]'),
('G', 'Natural Minor', '["G", "A", "A#", "C", "D", "D#", "F"]'),
('G#', 'Natural Minor', '["G#", "A#", "B", "C#", "D#", "E", "F#"]'),
('A', 'Natural Minor', '["A", "B", "C", "D", "E", "F", "G"]'),
('A#', 'Natural Minor', '["A#", "B#", "C#", "D#", "E#", "F#", "G#"]'),
('B', 'Natural Minor', '["B", "C#", "D", "E", "F#", "G", "A"]');

-- ============================================
-- Harmonic Minor スケールの登録
-- ============================================

INSERT INTO scale_master (scale_key, scale_name, notes) VALUES 
('C', 'Harmonic Minor', '["C", "D", "D#", "F", "G", "G#", "B"]'),
('C#', 'Harmonic Minor', '["C#", "D#", "E", "F#", "G#", "A", "C"]'),
('D', 'Harmonic Minor', '["D", "E", "F", "G", "A", "A#", "C#"]'),
('D#', 'Harmonic Minor', '["D#", "E#", "F#", "G#", "A#", "B", "D"]'),
('E', 'Harmonic Minor', '["E", "F#", "G", "A", "B", "C", "D#"]'),
('F', 'Harmonic Minor', '["F", "G", "G#", "A#", "C", "C#", "E"]'),
('F#', 'Harmonic Minor', '["F#", "G#", "A", "B", "C#", "D", "F"]'),
('G', 'Harmonic Minor', '["G", "A", "A#", "C", "D", "D#", "F#"]'),
('G#', 'Harmonic Minor', '["G#", "A#", "B", "C#", "D#", "E", "G"]'),
('A', 'Harmonic Minor', '["A", "B", "C", "D", "E", "F", "G#"]'),
('A#', 'Harmonic Minor', '["A#", "B#", "C#", "D#", "E#", "F#", "A"]'),
('B', 'Harmonic Minor', '["B", "C#", "D", "E", "F#", "G", "A#"]');

-- ============================================
-- Melodic Minor スケールの登録
-- ============================================

INSERT INTO scale_master (scale_key, scale_name, notes) VALUES 
('C', 'Melodic Minor', '["C", "D", "D#", "F", "G", "A", "B"]'),
('C#', 'Melodic Minor', '["C#", "D#", "E", "F#", "G#", "A#", "C"]'),
('D', 'Melodic Minor', '["D", "E", "F", "G", "A", "B", "C#"]'),
('D#', 'Melodic Minor', '["D#", "E#", "F#", "G#", "A#", "C", "D"]'),
('E', 'Melodic Minor', '["E", "F#", "G", "A", "B", "C#", "D#"]'),
('F', 'Melodic Minor', '["F", "G", "G#", "A#", "C", "D", "E"]'),
('F#', 'Melodic Minor', '["F#", "G#", "A", "B", "C#", "D#", "E#"]'),
('G', 'Melodic Minor', '["G", "A", "A#", "C", "D", "E", "F#"]'),
('G#', 'Melodic Minor', '["G#", "A#", "B", "C#", "D#", "F", "G"]'),
('A', 'Melodic Minor', '["A", "B", "C", "D", "E", "F#", "G#"]'),
('A#', 'Melodic Minor', '["A#", "B#", "C#", "D#", "E#", "F#", "A"]'),
('B', 'Melodic Minor', '["B", "C#", "D", "E", "F#", "G#", "A#"]');

-- ============================================
-- 終了
-- ============================================
