
pub struct ChessPosition {
    row: i8,
    col: i8,
}

impl ChessPosition {
    pub fn new(row: i8, col: i8) -> Result<Self, &'static str> {
        if let (0...7, 0...7) = (row, col) {
            return Ok(ChessPosition { row: row, col: col });
        }

        Err("Invalid Position")
    }


    pub fn same_diagonal(&self, other: &ChessPosition) -> bool {
        (self.row - other.row).abs() == (self.col - other.col).abs()
    }

    pub fn same_row(&self, other: &ChessPosition) -> bool {
        self.row == other.row
    }

    pub fn same_col(&self, other: &ChessPosition) -> bool {
        self.col == other.col
    }
}


pub struct Queen {
    pos: ChessPosition,
}

impl Queen {
    pub fn new(pos: ChessPosition) -> Self {
        Queen { pos: pos }
    }

    pub fn can_attack(&self, rival: &Queen) -> bool {
        self.pos.same_diagonal(&rival.pos) ||
        self.pos.same_row(&rival.pos) ||
        self.pos.same_col(&rival.pos)
    }
}
