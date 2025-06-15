-- ============================================
-- テーブル作成
-- ============================================

CREATE TABLE chord_notation_master (
    chord_name VARCHAR(20) NOT NULL PRIMARY KEY,  -- コード名
    general_notation VARCHAR(20) NOT NULL,  -- 一般的な表記 (ポピュラー, ロック, ポップス)
    jazz_notation VARCHAR(20),  -- ジャズの表記
    classical_notation VARCHAR(20),  -- クラシックの表記
    modern_notation VARCHAR(20),  -- 現代音楽の表記 (拡張コードなど)
    latest_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- ============================================
-- コード表記マスタ (`chord_notation_master`)
-- ============================================

INSERT INTO chord_notation_master (chord_name, general_notation, jazz_notation, classical_notation, modern_notation) VALUES 
('Major', 'M', '△', 'Maj', 'M'),
('Minor', 'm', '−', 'Min', 'm'),
('Major 7th', 'M7', '△7', 'Maj7', 'M7'),
('Minor 7th', 'm7', '−7', 'Min7', 'm7'),
('Dominant 7th', '7', '7', 'Dom7', '7'),
('Diminished', 'dim', '°', 'Diminished', 'dim'),
('Augmented', 'aug', '+', 'Aug', 'aug'),
('Suspended 2nd', 'Sus2', 'Sus2', 'Suspended 2nd', 'Sus2'),
('Suspended 4th', 'Sus4', 'Sus4', 'Suspended 4th', 'Sus4'),
('Add 9', 'Add9', 'Add9', 'Added 9th', 'Add9'),
('Major 9th', 'Maj9', '△9', 'Major 9th', 'Maj9'),
('Minor 9th', 'Min9', '−9', 'Minor 9th', 'Min9'),
('Major 11th', 'Maj11', '△11', 'Major 11th', 'Maj11'),
('Minor 11th', 'Min11', '−11', 'Minor 11th', 'Min11'),
('Major 13th', 'Maj13', '△13', 'Major 13th', 'Maj13'),
('Minor 13th', 'Min13', '−13', 'Minor 13th', 'Min13'),
('Half-Diminished', 'm7♭5', 'Ø', 'Half-Diminished', 'm7♭5'),
('Diminished 7th', 'Dim7', '°7', 'Diminished 7th', 'Dim7'),
('Dominant 9th', '9', '9', 'Dominant 9th', '9'),
('Dominant 11th', '11', '11', 'Dominant 11th', '11'),
('Dominant 13th', '13', '13', 'Dominant 13th', '13'),
('Major Minor 7th', 'MajMin7', 'MajMin7', NULL, 'MajMin7'),
('Minor Major 7th', 'mMaj7', 'm(Δ7)', NULL, 'mMaj7'),
('Minor Major 9th', 'mMaj9', 'm(Δ9)', NULL, 'mMaj9'),
('Minor Major 11th', 'mMaj11', 'm(Δ11)', NULL, 'mMaj11'),
('Minor Major 13th', 'mMaj13', 'm(Δ13)', NULL, 'mMaj13');
-- ============================================
-- 終了
-- ============================================
